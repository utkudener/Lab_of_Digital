# Lab of Digital Design

My student solutions for the **Lab of Digital Design** university course exercises.

- **Author:** [utkudener](https://github.com/utkudener)
- **Academic year:** 2026 / 2027
- **Simulation tool:** Mentor ModelSim
- **Language:** SystemVerilog

> This repository contains only my own student solutions. Course materials, lecture slides and homework briefs are not included.

---

## Repository Layout

```
Lab_of_Digital/
├── Exercise 1/
│   ├── Lab_of_Digital.mpf            ModelSim project file
│   ├── Submission/                   Files handed in for grading
│   │   ├── Full_Adder(Bevavioral)_Ex1.sv
│   │   ├── 4_bit_Ripple_Carry.sv
│   │   └── tb_Ripple_Carry_4bit.sv
│   └── Practice/                     Warm-up code following the lecture examples
│       ├── Half_Adder.sv
│       ├── Full_Adder.sv
│       ├── Ripple_Carry_Adder(Structural).sv
│       └── Ripple_Carry_Adder(Behavioral).sv
└── Exercise 2/
    └── ...                           (in progress)
```

Every exercise folder follows the same convention:

- `Submission/` — the exact files intended to be handed in.
- `Practice/` — supporting code written while learning the material; not part of the official submission.

---

## Exercise 1 — 4-bit Ripple Carry Adder

### Task

Design a 4-bit ripple carry adder using a **behavioral** description for the full adder. Write a testbench and verify the expected behavior with ModelSim.

### Approach

The exercise is solved by exactly three files, all placed in `Exercise 1/Submission/`:

| File | Module | Role |
|---|---|---|
| `Full_Adder(Bevavioral)_Ex1.sv` | `full_adder_beh` | Behavioral full adder (leaf module) |
| `4_bit_Ripple_Carry.sv` | `ripple_carry_4bit` | Hierarchical 4-bit RCA (top module) |
| `tb_Ripple_Carry_4bit.sv` | `tb_Ripple_Carry_4bit` | Testbench |

The **behavioral full adder** expresses sum and carry out as direct Boolean assigns:

```systemverilog
assign SUM  = A ^ B ^ CIN;
assign COUT = (A & B) | (CIN & (A ^ B));
```

The **4-bit ripple carry adder** instantiates `full_adder_beh` four times inside a `generate` / `for` loop. An internal 5-bit `INT` net forms the carry chain (`INT[0] = CIN`, `COUT = INT[4]`).

### Practice Files (not part of the submission)

The four files in `Exercise 1/Practice/` reproduce the step-by-step lecture examples:

| File | Description |
|---|---|
| `Half_Adder.sv` | Half adder (XOR + AND) |
| `Full_Adder.sv` | **Structural** full adder built from two `half_adder` instances |
| `Ripple_Carry_Adder(Structural).sv` | Structural RCA with four hand-wired `full_adder`s |
| `Ripple_Carry_Adder(Behavioral).sv` | Single-module behavioral RCA (not hierarchical) |

They are not the official submission — only warm-up code for the lecture examples.

### Test Scenario

`tb_Ripple_Carry_4bit.sv` applies four input vectors:

| A | B | CIN | A + B + CIN | Expected {COUT, SUM} |
|---|---|---|---|---|
| 0  | 0 | 0 | 0  | COUT=0, SUM=0000 |
| 5  | 2 | 1 | 8  | COUT=0, SUM=1000 |
| 4  | 3 | 0 | 7  | COUT=0, SUM=0111 |
| 15 | 1 | 0 | 16 | COUT=1, SUM=0000 |

### ModelSim Flow

1. Open the project: `Exercise 1/Lab_of_Digital.mpf`
2. Add the three source files (Add → Existing File):
   - `Submission/Full_Adder(Bevavioral)_Ex1.sv`
   - `Submission/4_bit_Ripple_Carry.sv`
   - `Submission/tb_Ripple_Carry_4bit.sv`
3. **Compile All** to compile the design.
4. **Simulate → Start Simulation**, choose `tb_Ripple_Carry_4bit` as the top-level unit.
5. **Add Wave → All items in region** to populate the waveform window.
6. `run -all` and verify that the waveform matches the expected values above.

---

## Exercise 2

Work in progress — scaffold files are in `Exercise 2/`. The layout will follow the same `Submission/` + `Practice/` convention once the exercise is finished.
