# Makefile learning

## What is Makefile

* generate  more than one object file with one command make
* the compile rule of a project
* discribe the process of linking and compile

In the command line,when we want to compile more than one file to a single objective file 

```Ma
gcc -o outfile name1.c name2.c
```

problems caused by the command line

* linking library: add the linking library by adding parameter
* the command line seems to be too long
* while take a long time in compiling, especially in complex project
* Makefile support mult-thread, which will reduce the time spending in compile
* need more than one compiler

## The principle of Makefile

### general structue

```Mak
targets:prerequisites
	command
```

or

```makefile
targets:prerequisites;command
	command
```



The meanings of different parts in Makefile

| tag           | function                                                     |
| ------------- | ------------------------------------------------------------ |
| targets       | the target of the command, usually is the Object File or the .exe file |
| prerequisites | the file that will be relied in the process of compiling     |
| command       | the commands make will execute, often more than one commands |

