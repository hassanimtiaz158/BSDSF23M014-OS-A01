# Final Merged Report

# Final Report – BSDSF23M014-OS-A01

## Feature 1: Repository Setup
I created a GitHub repository named **BSDSF23M014-OS-A01**, following the required naming convention (roll number in uppercase + `-OS-A01`).  
The repository was initialized with a `README.md` and `.gitignore` file.  

**Reflection:**  
- Git is important for version control because it tracks history, supports branching, and enables collaboration.  
- The `.gitignore` prevents unnecessary files (like `*.o`, binaries, and temporary editor files) from being committed.  

---

## Feature 2: Multifile Build
I refactored the project into multiple files:
- `src/mystrfunctions.c`
- `src/myfilefunctions.c`
- `src/main.c`
- Corresponding headers under `include/`

A **Makefile** was written to compile these files into an executable placed in `bin/client`.  
Objects were placed in the `obj/` directory.  

**Reflection:**  
- *Why multifile build?*  
  A multifile build makes the project modular, easier to maintain, and faster to compile since only changed files are rebuilt.  
- *Linking rule:*  
  Linking combines all object files (`.o`) into the final executable (`bin/client`).  

---

## Feature 3: Static Library
I created a **static library** (`lib/libmyutils.a`) from reusable functions in `mystrfunctions.c` and `myfilefunctions.c`.  
Then I linked `main.c` against this library to create `bin/client_static`.

**Tools used:**  
- `ar`: archives object files into a static library.  
- `nm`: lists symbols inside object files and libraries to verify functions are included.  

**Reflection:**  
- *Why use `ar`?*  
  It creates static libraries (`.a`) by archiving multiple `.o` files into one reusable package.  
- *Output of `nm`?*  
  Confirms which functions (symbols) are available for linking.  

---

## Feature 4: Dynamic Library
I compiled the functions into a **dynamic library** (`lib/libmyutils.so`) using `-fPIC -shared`.  
Then I linked `main.c` to produce `bin/client_dynamic`.  

**Tools used:**  
- `readelf`: shows ELF structure and confirms `.so` is a shared library.  
- `ldd`: lists which shared libraries a program depends on.  

**Reflection:**  
- *What is `-fPIC`?*  
  Position Independent Code: required for shared libraries so code can be loaded at any memory address.  
- *Difference in file size (static vs dynamic)?*  
  Static binaries are larger since the library code is embedded. Dynamic binaries are smaller because they reference the `.so` file at runtime.  
- *What is `LD_LIBRARY_PATH`?*  
  An environment variable that tells the dynamic loader where to find `.so` files. Setting it was necessary so the loader could locate `libmyutils.so` in `lib/`.  

---

## Feature 5: Documentation (Man Pages)
I created a **man/man3/** directory containing man pages for my functions (e.g., `mycat.1`).  
Each man page includes:
- `.TH` Title Header
- `.SH NAME`
- `.SH SYNOPSIS`
- `.SH DESCRIPTION`
- `.SH AUTHOR`

I added an **install target** to the Makefile so `sudo make install` installs:
- The binary into `/usr/local/bin/`
- The man page into `/usr/local/share/man/man1/`

Testing:  
- Running `client` executes the program from anywhere.  
- Running `man mycat` opens the manual page.  

**Reflection:**  
- *Why man pages?*  
  They provide standardized documentation directly accessible via the `man` command, making the program user-friendly and professional.  

---

## Tags & Releases
I created annotated tags for each milestone:
- `v0.1.1-multifile`
- `v0.2.1-static`
- `v0.3.1-dynamic`
- `v0.4.1-final`

Each GitHub release includes the binaries/libraries (`bin/client*`, `lib/*.a`, `lib/*.so`) as assets.

---

# Final Reflection
Through this assignment I learned:  
- How to structure a C project into `bin/`, `src/`, `lib/`, `include/`, `obj/`, `man/`.  
- How Makefiles automate building, cleaning, and installing.  
- The difference between static and dynamic linking, and tools like `ar`, `nm`, `readelf`, `ldd`.  
- How `-fPIC` enables shared libraries, and the role of `LD_LIBRARY_PATH`.  
- The importance of Git branching, tagging, and GitHub releases.  
- How to write man pages using `groff` syntax for documentation.  

This process covered real-world software engineering practices: modular code, builds, libraries, documentation, and version control.


