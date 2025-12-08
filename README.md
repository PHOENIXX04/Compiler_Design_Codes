# Compiler_Design_Codes

So... you are here to cheat I see. Well then in that case this is a guide on how you can run my programs on your system without any error.

---

## Running LEX (.l) and YACC (.y) Programs
This repository contains examples of programs written using **LEX** and **YACC**.  
This guide explains how to compile and run `.l` and `.y` files on any Linux system (Ubuntu recommended, WSL also works).

---

## 📦 Requirements

Install the required tools:

```bash
sudo apt update
sudo apt install flex bison gcc
```

---

## Running a LEX Program (.l)

1. Create a file where you can paste my code (file.l) and also another file for the data (data.txt).
   ```bash
   nano file.l
   nano data.txt
   ```

2. Generate the C source file.
   ```bash
   lex file.l
   ```

3. Compile the generated file.
   ```bash
   gcc lex.yy.c -lfl -o file
   ```

4. Run the program.
   ```bash
   ./file
   ```

Make sure that all these files are inside the same directory or else the code won't work or give errors. Also use the same file names I have used since they are mentioned inside the code as well.

---

## Running YACC + LEX Programs (.y + .l)

1. Same like before create the code and the data files.

2. Generate YACC parser files
   ```bash
   yacc -d file.y
   ```

3. Run LEX to generate scanner
   ```bash
   lex file.l
   ```

4. Compile both together
   ```bash
   gcc y.tab.c lex.yy.c -lfl -o file
   ```

5. Run the program
   ```bash
   ./file
   ```

---

So basically your order of inputting commands should be like following:
   ```bash
   nano file.y 
   nano file.l
   nano data.txt
   yacc -d file.y
   lex file.l
   gcc y.tab.c lex.yy.c -lfl -o file
   ./file
   ```

---

If you actually do end up using my codes for the practical, don't forget to follow my github since you will need it for rest of the practicals as well as for next sem :)

---
