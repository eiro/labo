package main
import (
    "fmt"
    "os"
    "io/ioutil"
)

func main () {
    fmt.Println( os.Args[1] )
    home := os.Getenv("HOME")
    files, err := ioutil.ReadDir( home + "/local" )
    if err != nil {
        fmt.Print(err)
        os.Exit(1)
   }
   for _,f := range files {
        fmt.Println(f.Name())
   }

}
