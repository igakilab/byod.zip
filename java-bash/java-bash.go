package main

import (
	"fmt"
	"os"
	"os/exec"
)

func main() {
	os.Setenv("CHERE_INVOKING", "1")
	os.Setenv("MSYSTEM", "MINGW64")
	uprofile := os.Getenv("USERPROFILE")
	workhome := uprofile + `\oithomes\java`
        os.Chdir(workhome)
	cmd := exec.Command(`C:\oit\java20\PortableGit-2.25.0-64\usr\bin\mintty.exe`,`-i`,`C:\oit\java20\PortableGit-2.25.0-64\java-bash.ico`,`C:\oit\java20\PortableGit-2.25.0-64\usr\bin\bash.exe`, `--login`, `-i`)
	cmd.Stdin = os.Stdin
	cmd.Stdout = os.Stdout
	cmd.Stderr = os.Stderr
	if err := cmd.Run(); err != nil {
		fmt.Fprintln(os.Stderr, err)
		os.Exit(1)
	}
        fmt.Printf("exec command")
}