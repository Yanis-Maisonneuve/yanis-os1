# Assignment 4: Threads & Synchronization

## MAISONNEUVE YANIS

## Project Description
This assignment demonstrates how threading and synchronization work in Python. The script `threads_syncs.py` compares two cases:
1. Concurrent counter updates without synchronization.
2. Counter updates with a mutex lock to ensure thread safety.

---

## Step-by-Step Explanation of `threads_syncs.py`

### 1. Global configuration
- `counter` is the shared integer variable accessed by all threads.
- `NUM_THREADS` is set to 4, meaning the program runs four threads concurrently.
- `ITERATIONS` is set to 1,000,000, so each thread attempts one million increments.
- `counter_lock = threading.Lock()` creates a mutex used only in the synchronized version.

### 2. Part 1: Unsynchronized worker
- Function: `unsynchronized_worker()`
- Behavior: each thread reads `counter`, increments the value, then writes it back.
- Problem: `counter += 1` is not atomic at the CPU level. It is executed as three operations:
  1. Read the current counter value.
  2. Increment the local value.
  3. Write the new value back to memory.
- Because multiple threads can interleave these steps, increments can be lost.

### 3. Part 2: Synchronized worker with a mutex
- Function: `synchronized_worker()`
- Behavior: the thread enters a `with counter_lock:` block before modifying `counter`.
- The lock guarantees that only one thread performs the read-modify-write sequence at a time.
- This prevents race conditions and ensures the counter update is safe.

### 4. Running Part 1
- Function: `run_part1_unspaced()`
- Steps:
  1. Reset `counter` to zero.
  2. Create and start 4 threads using `unsynchronized_worker()`.
  3. Wait for all threads to complete with `join()`.
  4. Print expected and actual counter values, plus the number of lost increments.

### 5. Running Part 2
- Function: `run_part2_synced()`
- Steps:
  1. Reset `counter` to zero.
  2. Create and start 4 threads using `synchronized_worker()`.
  3. Wait for all threads to complete with `join()`.
  4. Print expected and actual counter values and whether the result matches the expectation.

### 6. Program flow
- When `threads_syncs.py` is executed directly, it runs Part 1 first, then Part 2.
- The output clearly contrasts the race condition behavior with the safe, locked version.

---

## Detailed Behavior and Expected Results

### Part 1 expected behavior
- The program should show an expected result of `4,000,000`.
- The actual result is likely lower because unsynchronized threads override each other.
- This demonstrates the race condition in practice.

### Part 2 expected behavior
- The expected result remains `4,000,000`.
- With `threading.Lock()`, the actual result should also be `4,000,000`.
- The program reports success when the actual count matches the expected count.

---

## How to Run the Script

1. Open a terminal in the `tp4` directory.
2. Run the script:
   ```bash
   python3 threads_syncs.py
   ```
3. Observe the output for both parts.

---

## Notes

- The unsynchronized version highlights how thread interleaving can corrupt shared data.
- The synchronized version uses `threading.Lock()` to serialize access to the shared variable.
- This script is designed for Python 3 and is best run on a POSIX-compatible system such as Linux.

