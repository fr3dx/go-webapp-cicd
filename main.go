package main

import (
	"fmt"
	"log"
	"net/http"
)

func handler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprint(w, "Hello from Docker, Ferenc. M")
}

func main (){
	http.HandleFunc("/", handler)
	log.Fatal(http.ListenAndServe("0.0.0.0:80", nil))
}