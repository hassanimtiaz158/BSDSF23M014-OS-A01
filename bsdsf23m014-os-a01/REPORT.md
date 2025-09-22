# Project Report

## 1. Linking Rule in the Makefile

```make
$(TARGET): $(OBJECTS)
```

* **Explanation:** This rule specifies that the final executable (`$(TARGET)`) depends on all object files listed in `$(OBJECTS)`).
* When any object file changes, `make` will re-run the linker to generate the updated executable.
* Typical command under this rule:

```make
$(CC) $(OBJECTS) -o $(TARGET)
```

**Difference from linking against a library:**

* Linking against a library includes library files:

```make
$(TARGET): $(OBJECTS)
    $(CC) $(OBJECTS) -L/path/to/lib -lmylib -o $(TARGET)
```

* The linker resolves symbols from both your object files and the external library (`-lmylib`).

---

## 2. Git Tags

* **Definition:** A tag in Git is a reference to a specific commit, usually marking an important point like a release.
* **Usefulness:** Tags make it easy to identify stable versions and allow developers or users to check out or distribute a specific release.

**Types of Tags:**

1. **Lightweight Tag:**

   * A simple pointer to a commit with no extra information.

   ```bash
   git tag v1.0
   ```

2. **Annotated Tag:**

   * Stores metadata such as author, date, and a message; stored as a full Git object.

   ```bash
   git tag -a v1.0 -m "Release version 1.0"
   ```

   * Recommended for official releases.

---

## 3. Purpose of Creating a "Release" on GitHub

* **Definition:** A Release is a snapshot of the repository at a specific commit, often associated with a version tag.
* **Purpose:** It communicates a stable version of the project to users, making it easy to download and use.

**Significance of Attaching Binaries:**

* Users can download precompiled executables (like your client program) without building from source.
* This is useful for non-developers or systems where building from source is difficult.
