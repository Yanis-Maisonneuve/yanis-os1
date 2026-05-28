# Assignment 3: Process Creation & IPC

## MAISONNEUVE YANIS

---

## Project Description
This project demonstrates process creation and inter-process communication (IPC) in Python. The parent process creates a child process, sends a text message through a pipe, and receives the transformed response from the child.

---

## Step-by-Step Script Overview

1. Create a duplex anonymous pipe using `multiprocessing.Pipe()`.
   - This pipe provides two connection endpoints: one for the parent and one for the child.
2. Define the child worker function.
   - The child process uses `conn.recv()` to receive a message from the parent.
   - It transforms the message by converting it to uppercase and reversing it.
   - It sends the transformed message back using `conn.send()`.
3. Start the child process with `multiprocessing.Process(...)`.
   - The parent process creates the child and starts it with `child_process.start()`.
4. Send the message from the parent to the child.
   - The parent sends a text string through the parent-side pipe endpoint.
5. Receive the response from the child.
   - The parent waits on `parent_conn.recv()` and receives the transformed string.
6. Join the child process.
   - The parent calls `child_process.join()` to wait until the child ends.

---

## What the Script Does

- The parent prints its PID and initializes the pipe.
- The parent spawns the child process, passing one pipe endpoint to it.
- The child waits for a message, processes it, and sends the result back.
- The parent receives the transformed message and prints it.
- The parent then waits for the child to finish before exiting.

---

## How to Run the Script

1. Open a terminal in the `tp3` directory.
2. Run:
   ```bash
   python3 process_ipcs.py
   ```
3. Observe the console output showing:
   - parent PID
   - child PID
   - the message sent by the parent
   - the transformed message received back

---

## Expected Output Example

The program should display logs similar to:

```text
[Parent - PID xxxxx] Parent process initialized.
[Parent - PID xxxxx] Spawning child process...
[Child  - PID xxxxx] Process started. Waiting for data from parent...
[Parent - PID xxxxx] Sending data to child: 'Operating Systems 2026'
[Parent - PID xxxxx] Waiting for response from child...
[Child  - PID xxxxx] Received data from parent: 'Operating Systems 2026'
[Child  - PID xxxxx] Transforming data...
[Child  - PID xxxxx] Sent transformed data back to parent. Exiting.
[Parent - PID xxxxx] Success! Received from child: '6202 SMETSYS GNITAREPO'
[Parent - PID xxxxx] Child process joined. Program execution completed.
```

---

## Notes

- This implementation uses `multiprocessing.Pipe()` for direct, two-way communication between exactly two processes.
- The child process runs independently and returns its result only after transformation is complete.
- The script is designed for POSIX-compatible environments such as Linux.

