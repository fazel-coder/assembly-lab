# Assembly Lab – Conditional Instructions

## Student
Fazel Rahman

## Objective
This repository contains the solutions for the Conditional Instructions Assembly Language lab.

## Files
- `task1.asm` – Generates a sequence of even or odd numbers up to 20.
- `task2.asm` – Finds the largest number among five integer values and stores the result in the variable `largest`.
- `flowchart.png` – Flowchart showing the logic used to solve both tasks.

## Flowchart

See `flowchart.png` for the flowchart used in designing the programs.

## Challenges Encountered

One of the main challenges was understanding how conditional jump instructions work and choosing the correct jump instruction for each situation. Another challenge was managing loops and making sure they ended at the correct time without skipping or repeating values. I also had to keep track of register values while comparing numbers to find the largest value. Using `gdb` to step through the program instruction by instruction helped me identify and fix logic errors.

## Debugging

The following commands were used while debugging:

```
layout asm
layout regs
watch (int) largest
break _start
run
stepi
```

## GitHub Repository

This repository was created to submit the completed Assembly Lab assignment.
