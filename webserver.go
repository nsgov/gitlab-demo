// demo for devops halifax -szinck
package main

import (
	"log"
	"net/http"
	"html/template"
)


var temp *template.Template

func init() {
	temp = template.Must(template.ParseFiles("/usr/local/bin/devops.html"))
	}



func helloworld(w http.ResponseWriter, r *http.Request) {

	err := temp.ExecuteTemplate(w, "devops.html", "DevOps Halifax")

	if err != nil {
		log.Fatalln(err)
	}
	
}

func main() {

	http.HandleFunc("/", helloworld)           
	err := http.ListenAndServe(":8081", nil) // open port 8081
	if err != nil {
		log.Fatal(err)
	}
}
