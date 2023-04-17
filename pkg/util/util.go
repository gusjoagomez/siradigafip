package util

import (
	"archive/zip"
	"bufio"
	"bytes"
	"fmt"
	"html/template"
	"io"
	"io/fs"
	"io/ioutil"
	"os"
	"path/filepath"
	"regexp"
	"strings"
	"time"
)

func InvertCamelCase(str string) string {
	var matchFirstCap = regexp.MustCompile("(.)([A-Z][a-z]+)")
	var matchAllCap = regexp.MustCompile("([a-z0-9])([A-Z])")
	snake := matchFirstCap.ReplaceAllString(str, "${1} ${2}")
	snake = matchAllCap.ReplaceAllString(snake, "${1} ${2}")
	return strings.Title(snake)
}

func IsVowel(c rune) bool {
	var ret bool = false
	switch c {
	case 'a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U':
		ret = true
	}
	return ret
}

func ToPlural(cadena string) string {
	var retorno string
	r := []rune(cadena)
	if IsVowel(r[len(r)-1]) {
		retorno = cadena + "s"
	} else {
		retorno = cadena + "es"
	}
	return retorno
}

func FileExists(filename string) bool {
	info, err := os.Stat(filename)
	if os.IsNotExist(err) {
		return false
	}
	return !info.IsDir()
}

func DirectoryExists(directory string) bool {
	if _, err := os.Stat(directory); os.IsNotExist(err) {
		return false
	} else {
		return true
	}
}

func ReadLines(path string) ([]string, error) {
	file, err := os.Open(path)
	if err != nil {
		return nil, err
	}
	defer file.Close()

	var lines []string
	scanner := bufio.NewScanner(file)
	for scanner.Scan() {
		lines = append(lines, scanner.Text())
	}
	return lines, scanner.Err()
}

func ReadContent(path string) string {

	b, err := ioutil.ReadFile(path)
	if err != nil {
		fmt.Print("Error al leer el archivo" + path)
		fmt.Print(err)
	}
	return string(b)
}

/**
 * Inserta una cadena en la posicion N de un archivo
 */
func InsertStringToFile(path, str string, index int) error {
	lines, err := ReadLines(path)
	if err != nil {
		return err
	}

	fileContent := ""
	for i, line := range lines {
		if i == index {
			fileContent += str
		}
		fileContent += line
		fileContent += "\n"
	}
	return ioutil.WriteFile(path, []byte(fileContent), 0644)
}

/*
Retorna el indice o numero de linea donde se encuentra una cadena
*/
func SearchOnLines(str string, lines []string) int {
	for i, line := range lines {
		if strings.Contains(line, str) {
			return i
		}
	}
	return -1
}

func ExistsInFile(str, file string) bool {

	lines, err := ReadLines(file)
	if err != nil {
		fmt.Println("Error reading file: " + err.Error())
	}
	res := SearchOnLines(str, lines)
	if res != -1 {
		return true
	}
	return false

}

func InsertLineAfterStringOnFile(file, search, newstring string) {
	lines, err := ReadLines(file)
	if err == nil {
		idx := SearchOnLines(search, lines)
		if idx != -1 {
			InsertStringToFile(file, newstring, idx+1)
		}
	} else {
		fmt.Println("Error al leer archivo: " + file)
		fmt.Println(err)
		fmt.Println("---------------")
	}
}

func CreateDirIfNotExist(path string) error {
	err := os.MkdirAll(path, os.FileMode(0775))
	if err == nil || os.IsExist(err) {
		return nil
	} else {
		return err
	}
}

func Copy(src, dst string) error {
	in, err := os.Open(src)
	if err != nil {
		return err
	}
	defer in.Close()

	out, err := os.Create(dst)
	if err != nil {
		return err
	}
	defer out.Close()

	_, err = io.Copy(out, in)
	if err != nil {
		return err
	}
	return out.Close()
}

func DeleteFile(filename string) bool {
	var ret bool = false
	e := os.Remove(filename)
	if e != nil {
		ret = false
	} else {
		ret = true
	}
	return ret
}

func IsExtension(filename, ext string) bool {
	filename = strings.ToLower(filename)
	//fmt.Println("file, ext: "+filepath.Ext(filename), ext)
	if filepath.Ext(filename) == ext {
		return true
	} else {
		return false
	}
}

func GetFilesExtension(root, ext string) []string {
	var a []string
	filepath.WalkDir(root, func(s string, d fs.DirEntry, e error) error {
		if e != nil {
			return e
		}
		if filepath.Ext(d.Name()) == ext {
			a = append(a, s)
		}
		return nil
	})
	return a
}

func UnzipSource(source, destination string) error {
	// 1. Abre el archivo zip
	reader, err := zip.OpenReader(source)
	if err != nil {
		return err
	}
	defer reader.Close()

	// 2. Recupera el directorio absoluto al path destino
	destination, err = filepath.Abs(destination)
	if err != nil {
		return err
	}

	// 3. Recorre los archivos dentro del zip y descomprime cada uno de ellos
	for _, f := range reader.File {
		err := UnzipFile(f, destination)
		if err != nil {
			return err
		}
	}

	return nil
}

func UnzipFile(f *zip.File, destination string) error {
	// 4. Revisa si existe el path y si no es vulnerable al "Zip Slip"
	filePath := filepath.Join(destination, f.Name)
	if !strings.HasPrefix(filePath, filepath.Clean(destination)+string(os.PathSeparator)) {
		return fmt.Errorf("invalid file path: %s", filePath)
	}

	// 5. Crea el Arbol de directorios
	if f.FileInfo().IsDir() {
		if err := os.MkdirAll(filePath, os.ModePerm); err != nil {
			return err
		}
		return nil
	}

	if err := os.MkdirAll(filepath.Dir(filePath), os.ModePerm); err != nil {
		return err
	}

	// 6. Crea el destino para descomprimir el archivo
	destinationFile, err := os.OpenFile(filePath, os.O_WRONLY|os.O_CREATE|os.O_TRUNC, f.Mode())
	if err != nil {
		return err
	}
	defer destinationFile.Close()

	// 7. Descomprime el contenido del archivo y lo copia al archivo destino
	zippedFile, err := f.Open()
	if err != nil {
		return err
	}
	defer zippedFile.Close()

	if _, err := io.Copy(destinationFile, zippedFile); err != nil {
		return err
	}
	return nil
}

func ToArrayString(data map[string]interface{}) map[string]string {
	ret := make(map[string]string)

	for k, item := range data {
		ret[k] = fmt.Sprintf("%v", item)
	}

	return ret
}

func RemoveExtension(filename string) string {
	var extension = filepath.Ext(filename)
	name := strings.TrimRight(filename, extension)
	return name
}

func RenderTemplete(file string, data map[string]interface{}) string {
	t, err := template.ParseFiles(file)
	if err != nil {
		panic(err)
	}

	var buf bytes.Buffer
	if err := t.Execute(&buf, data); err != nil {
		panic(err)
	}
	return buf.String()
}

func RemoveFromAString(s []string, r, method string) []string {
	var excluir bool
	var ret []string

	// si es blanco setea default igual
	if method == "" {
		method = "eq"
	}

	for i, v := range s {
		excluir = false
		switch method {
		case "eq": //equal
			if v == r {
				excluir = true
			}
		case "lf": //left
			excluir = strings.HasPrefix(v, r)
		case "rt": //rigth
			excluir = strings.HasSuffix(v, r)
		case "ct": //contain
			excluir = strings.Contains(v, r)
		}
		if !excluir {
			ret = append(ret, s[i])
		}
	}
	return ret
}

func SnakeCaseToCamelCase(inputUnderScoreStr string) (camelCase string) {
	//snake_case to camelCase

	isToUpper := false
	for k, v := range inputUnderScoreStr {
		if k == 0 {
			camelCase = strings.ToUpper(string(inputUnderScoreStr[0]))
		} else {
			if isToUpper {
				camelCase += strings.ToUpper(string(v))
				isToUpper = false
			} else {
				if v == '_' {
					isToUpper = true
				} else {
					camelCase += string(v)
				}
			}
		}
	}
	return
}

// --- wilcard implementation
func StringToRuneSlice(s string) []rune {
	var r []rune
	for _, runeValue := range s {
		r = append(r, runeValue)
	}
	return r
}

func initLookupTable(row, column int) [][]bool {
	lookup := make([][]bool, row)
	for i := range lookup {
		lookup[i] = make([]bool, column)
	}
	return lookup
}

// Function that matches input str with given wildcard pattern
func WildcardPatternMatch(str, pattern string) bool {
	s := StringToRuneSlice(str)
	p := StringToRuneSlice(pattern)

	// empty pattern can only match with empty string
	if len(p) == 0 {
		return len(s) == 0
	}

	// lookup table for storing results of subproblems
	// zero value of lookup is false
	lookup := initLookupTable(len(s)+1, len(p)+1)

	// empty pattern can match with empty string
	lookup[0][0] = true

	// Only '*' can match with empty string
	for j := 1; j < len(p)+1; j++ {
		if p[j-1] == '*' {
			lookup[0][j] = lookup[0][j-1]
		}
	}

	// fill the table in bottom-up fashion
	for i := 1; i < len(s)+1; i++ {
		for j := 1; j < len(p)+1; j++ {
			if p[j-1] == '*' {
				// Two cases if we see a '*'
				// a) We ignore ‘*’ character and move
				//    to next  character in the pattern,
				//     i.e., ‘*’ indicates an empty sequence.
				// b) '*' character matches with ith
				//     character in input
				lookup[i][j] = lookup[i][j-1] || lookup[i-1][j]

			} else if p[j-1] == '?' || s[i-1] == p[j-1] {
				// Current characters are considered as
				// matching in two cases
				// (a) current character of pattern is '?'
				// (b) characters actually match
				lookup[i][j] = lookup[i-1][j-1]

			} else {
				// If characters don't match
				lookup[i][j] = false
			}
		}
	}

	return lookup[len(s)][len(p)]
}

func FirstAndLastDateMonth(year, month int) (time.Time, time.Time) {
	fd := FirstDateOfMonth(year, month)
	fh := LastDateOfMonth(year, month)
	return fd, fh
}

func LastDateOfYear(year int) time.Time {
	return time.Date(year+1, 1, 0, 0, 0, 0, 0, time.UTC)
}

func FirstDateOfYear(year int) time.Time {
	return time.Date(year, time.January, 1, 0, 0, 0, 0, time.UTC)
}

func LastDateOfMonth(year, month int) time.Time {
	monthInt := time.Month(month)
	return time.Date(year, monthInt+1, 0, 0, 0, 0, 0, time.UTC)
}
func FirstDateOfMonth(year, month int) time.Time {
	monthInt := time.Month(month)
	return time.Date(year, monthInt, 1, 0, 0, 0, 0, time.UTC)
}

//--- end: wilcard implementation
