# Project Workflow – BSDSF23M014-OS-A01

This document describes the current project directory structure and workflow.

---

## Directory Structure

```
├── bin
├── bsdsf23m014-od-a01
│   ├── bin
│   ├── include
│   ├── lib
│   ├── obj
│   └── src
├── bsdsf23m014-os-a01
│   ├── bin
│   │   ├── client_dynamic
│   │   └── client_static
│   ├── include
│   │   ├── Makefile
│   │   ├── myfilefunctions.h
│   │   └── mystrfunctions.h
│   ├── lib
│   │   ├── libmyutils.a
│   │   └── libmyutils.so
│   ├── Makefile
│   ├── obj
│   │   ├── main.o
│   │   ├── myfilefunctions.o
│   │   ├── myfilefunctions.pic.o
│   │   ├── mystrfunctions.o
│   │   └── mystrfunctions.pic.o
│   ├── REPORT.md
│   └── src
│       ├── BSDSF23M014-OS-A01
│       │   ├── bsdsf23m014-os-a01
│       │   │   ├── bin
│       │   │   ├── include
│       │   │   ├── lib
│       │   │   ├── obj
│       │   │   ├── REPORT.md
│       │   │   └── src
│       │   └── README.md
│       ├── main.c
│       ├── Makefile
│       ├── myfilefunctions.c
│       └── mystrfunctions.c
├── client
├── lib
├── Makefile
├── man
│   ├── man3
│   │   ├── client.1
│   │   ├── man3
│   │   └── mycat.1
│   └── Man3
├── mycat
├── obj
│   └── bsdsf23m014-os-a01
│       └── src
│           ├── main.o
│           ├── myfilefunctions.o
│           └── mystrfunctions.o
├── README.md
└── src
    └── Makefile
```

---

## Explanation of Key Directories

- **bin/**  
  Stores compiled executables (`client`, `mycat`, etc.).

- **bsdsf23m014-os-a01/**  
  Main project folder with its own build structure:  
  - `src/` → C source files (`main.c`, `myfilefunctions.c`, `mystrfunctions.c`).  
  - `include/` → header files (`myfilefunctions.h`, `mystrfunctions.h`).  
  - `obj/` → object files (`.o`), including PIC objects for shared library.  
  - `lib/` → compiled libraries (`libmyutils.a`, `libmyutils.so`).  
  - `bin/` → executables (`client_static`, `client_dynamic`).  
  - `Makefile` → automates compilation.  
  - `REPORT.md` → documentation for this part of the project.  

- **lib/**  
  Additional library directory at the root (currently empty).  

- **obj/**  
  Object files generated during root-level builds.  

- **man/**  
  Contains manual pages for documentation:  
  - `man3/` → `mycat.1`, `client.1`.  
  - `Man3/` → duplicate/old folder.  

- **src/**  
  Extra source directory with its own Makefile.  

- **README.md**  
  Project description file.  

---

## Workflow Summary

1. **Write source code** → in `bsdsf23m014-os-a01/src/`.  
2. **Declare functions** → in `bsdsf23m014-os-a01/include/*.h`.  
3. **Compile** → object files go into `obj/`.  
4. **Archive/Link** →  
   - Create static library: `lib/libmyutils.a`  
   - Create dynamic library: `lib/libmyutils.so`  
5. **Build executables** → placed into `bin/` (`client_static`, `client_dynamic`).  
6. **Documentation** → man pages in `man/man3/` (`mycat.1`, `client.1`).  
7. **Install** → `make install` copies binary into `/usr/local/bin/` and man pages into `/usr/local/share/man/`.  

---

## Visual Workflow (Mermaid Diagram)

```mermaid
flowchart TD
    A[Source Files: src/*.c] --> B[Object Files: obj/*.o]
    B --> C1[Static Library: lib/libmyutils.a]
    B --> C2[Dynamic Library: lib/libmyutils.so]
    C1 --> D1[Executable: bin/client_static]
    C2 --> D2[Executable: bin/client_dynamic]
    A --> D3[Executable: bin/client (multifile build)]
    E[Man Pages: man/man3/*.1] --> F[Install Man Pages]
    D1 --> G[Install Binaries]
    D2 --> G
    D3 --> G
    G --> H[/usr/local/bin/]
    F --> I[/usr/local/share/man/]
```
