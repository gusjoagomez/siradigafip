package mvc

import (
	"context"
	"net/http"

	mux "github.com/gorilla/mux"
	"github.com/gorilla/sessions"
)

var store = sessions.NewCookieStore([]byte("MiSesionFlashAbracadabra"))

type Route struct {
	path    string
	f       *http.Handler
	methods []string
}

type Controller struct {
	ct      context.Context
	routes  []Route
	Router  *mux.Router
	Request *http.Request
	//Store   *sessions.CookieStore
}

func (c *Controller) SetMux(r *mux.Router) { //*mux.Router
	c.Router = r
	//return c.Router
}

func (c *Controller) NewRoute(path string, f func(w http.ResponseWriter, r *http.Request), methods ...string) *mux.Router {
	c.Router.HandleFunc(path, f).Methods(methods...)
	return c.Router
}

func (c *Controller) Render() string {

	return "Test"
}

func (c *Controller) Redirect(url string, code int) {
	//c.ct.Redirect(code, url)
}
