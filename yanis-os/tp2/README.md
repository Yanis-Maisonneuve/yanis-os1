# Assignment 2: File System Interaction

**Author:** Yanis Maisonneuve

## Project Description
This script interacts directly with the Linux file system using Python's standard OS abstraction libraries. It accepts a directory path as input, scans the directory, and retrieves metadata for each file, including file size in bytes and POSIX permissions.

---

## Technical Report: OS Functions & Library Justification

The following Python functions were used to access file system metadata and interfaces:

1. `os.listdir(path)`
   * Why: This function wraps the POSIX `opendir()` and `readdir()` calls. It requests the kernel to read the directory entries and returns the list of file names contained in the specified directory.
2. `os.stat(path)`
   * Why: This function directly calls the native Linux `stat()` system call. It retrieves inode metadata from the file system, including `st_size` (file size in bytes) and `st_mode` (file type and permission bits).
3. `stat.filemode()`
   * Why: The `st_mode` value returned by `os.stat()` is an integer bitmask. `stat.filemode()` converts that mask into the standard human-readable POSIX format (for example, `-rw-r--r--`), showing read, write, and execute permissions for user, group, and others.

---

## Example Execution
A demonstration document is available: `tp2 screen.odt`

## How to Run the Program

1. Run the script from your terminal in a Linux-compatible environment (Killercoda, Google Colab, or local Linux):
   ```bash
   python3 file_analyzer.py
`