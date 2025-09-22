# REPORT.md

## 1. Compare the Makefile from Part 2 and Part 3
- **Part 2 Makefile**:  
  - The goal (`$(TARGET): $(OBJECTS)`) directly links object files into the final executable.  
  - Only `gcc` is used for compiling and linking.  

- **Part 3 Makefile**:  
  - Introduces rules and variables for building a **static library** (`libmylib.a`).  
  - Uses `ar rcs` to combine object files into the `.a` archive.  
  - The client program (`client_static`) links against this library instead of directly linking each `.o` file.  
  - Key difference: Part 3 separates the concerns → first build a reusable library, then link it into executables.

---

## 2. Purpose of `ar` and `ranlib`
- **`ar`**: The *archiver* command.  
  - Collects multiple `.o` (object) files into a single `.a` (archive) static library.  
  - Example:  
    ```bash
    ar rcs libmylib.a file1.o file2.o
    ```

- **`ranlib`**: Generates or updates an index of the symbols inside the `.a` library.  
  - This helps the linker (`ld`) quickly find which object file defines which function.  
  - On modern Linux systems, `ar rcs` already creates the index, but `ranlib` is still often used for portability and to avoid linker warnings.

---

## 3. `nm` on the `client_static` executable
- Running `nm client_static` will **not** show the function symbols (like `mystrlen`) as undefined.  
- Instead, you’ll see them embedded in the executable itself.  
- This demonstrates how **static linking works**:  
  - The required functions are copied from the static library into the final executable at build time.  
  - Unlike dynamic linking, the executable is self-contained and does not rely on an external `.so` file at runtime.

---
