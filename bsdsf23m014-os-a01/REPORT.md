# REPORT.md

## 1. Position-Independent Code (-fPIC)
- **Position-Independent Code (PIC)** is machine code that can execute properly regardless of its absolute memory address.  
- Compiling with `-fPIC` ensures that the generated object files use relative addressing rather than fixed addresses.  
- This is a **fundamental requirement for shared libraries** because:
  - Shared libraries may be loaded into different memory addresses in different programs.  
  - The dynamic loader must be able to place the library anywhere in the process address space without relocation errors.  

---

## 2. File size difference: Static vs Dynamic clients
- The **static client** is noticeably larger because:
  - All required functions from the static library are **copied directly into the executable** at build time.  
  - This creates a self-contained binary but duplicates code if multiple programs use the same library.  

- The **dynamic client** is smaller because:
  - It only contains references (symbols) to functions in the shared library.  
  - The actual function code stays in the `.so` file and is loaded at runtime by the operating system.  

- **Conclusion:** Static linking = bigger executables, Dynamic linking = smaller executables but requires shared library at runtime.

---

## 3. LD_LIBRARY_PATH and the dynamic loader
- **`LD_LIBRARY_PATH`** is an environment variable that specifies directories where the dynamic loader should look for shared libraries at runtime.  
- It was necessary to set this variable because:
  - By default, the loader searches only standard system library paths (e.g., `/lib`, `/usr/lib`).  
  - Our custom shared library (`libmylib.so`) was in a non-standard location (e.g., `./lib`).  

- **Dynamic loader responsibilities:**
  - Finds and loads the required `.so` files into memory before the program starts execution.  
  - Resolves symbol references so the program can call functions from the shared library.  
  - Ensures that the same shared library can be mapped into multiple programs’ address spaces to save memory.

---

