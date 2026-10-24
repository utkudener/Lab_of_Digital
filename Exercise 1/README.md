# Exercise 1 — 4-bit Ripple Carry Adder

## Task

Design a 4-bit ripple carry adder using a **behavioral** description for the full adder. Write a testbench and verify the expected behavior with ModelSim.

## Folder Layout

```
Exercise 1/
├── Lab_of_Digital.mpf            ModelSim project file
├── Exercise1_Report.pdf          Short report describing the submission
├── Submission/                   Files handed in for grading
│   ├── Full_Adder(Bevavioral)_Ex1.sv
│   ├── 4_bit_Ripple_Carry.sv
│   └── tb_Ripple_Carry_4bit.sv
└── Practice/                     Warm-up code following the lecture examples
    ├── Half_Adder.sv
    ├── Full_Adder.sv
    ├── Ripple_Carry_Adder(Structural).sv
    └── Ripple_Carry_Adder(Behavioral).sv
```

## Submission

The exercise is solved by exactly three files, all placed in `Submission/`:

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

## Practice (not part of the submission)

The four files in `Practice/` reproduce the step-by-step lecture examples:

| File | Description |
|---|---|
| `Half_Adder.sv` | Half adder (XOR + AND) |
| `Full_Adder.sv` | **Structural** full adder built from two `half_adder` instances |
| `Ripple_Carry_Adder(Structural).sv` | Structural RCA with four hand-wired `full_adder`s |
| `Ripple_Carry_Adder(Behavioral).sv` | Single-module behavioral RCA (not hierarchical) |

They are not the official submission — only warm-up code for the lecture examples.

## Test Scenario

`tb_Ripple_Carry_4bit.sv` applies four input vectors:

| A | B | CIN | A + B + CIN | Expected {COUT, SUM} |
|---|---|---|---|---|
| 0  | 0 | 0 | 0  | COUT=0, SUM=0000 |
| 5  | 2 | 1 | 8  | COUT=0, SUM=1000 |
| 4  | 3 | 0 | 7  | COUT=0, SUM=0111 |
| 15 | 1 | 0 | 16 | COUT=1, SUM=0000 |

## ModelSim Flow

1. Open the project: `Lab_of_Digital.mpf`
2. Add the three source files (Add → Existing File):
   - `Submission/Full_Adder(Bevavioral)_Ex1.sv`
   - `Submission/4_bit_Ripple_Carry.sv`
   - `Submission/tb_Ripple_Carry_4bit.sv`
3. **Compile All** to compile the design.
4. **Simulate → Start Simulation**, choose `tb_Ripple_Carry_4bit` as the top-level unit.
5. **Add Wave → All items in region** to populate the waveform window.
6. `run -all` and verify that the waveform matches the expected values above.
