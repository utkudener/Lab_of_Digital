# Exercise 2 — 8-bit Shift Register (with warm-up on sequential primitives)

## Task

Design an 8-bit shift register with the following modes, driven by a 2-bit `ctrl` input: **hold**, **shift left**, **shift right**, **parallel load**. The register must have an active-low asynchronous reset. Write a testbench that exercises every mode and verify the behavior with ModelSim.

As preparation, this exercise also walks through the sequential building blocks the shift register is built from (D flip-flop, latch, counter, 2:1 MUX styles).

## Folder Layout

```
Exercise 2/
├── Exercise 2.mpf                      ModelSim project file
├── Submission/                         Files handed in for grading
│   ├── Shift_Register.sv
│   └── tb_Shift_Register.sv
└── Practice/                           Warm-up code for the lecture examples
    ├── Mux21.sv
    ├── Mux21(Case-Statement).sv
    ├── Mux21(If-else).sv
    ├── Flip_flop_AsynchronousReset.sv
    ├── Flip_flop_SynchronousReset.sv
    ├── Latch.sv
    ├── Counter.sv
    └── tb_Flipflop.sv
```

## Submission

| File | Module | Role |
|---|---|---|
| `Shift_Register.sv` | `shift_register` | 8-bit shift register, 4 operating modes, async active-low reset |
| `tb_Shift_Register.sv` | `tb_shift_register` | Testbench |

### Interface

| Signal | Dir | Width | Description |
|---|---|---|---|
| `clk` | in | 1 | Clock |
| `rstn` | in | 1 | Active-low asynchronous reset |
| `ctrl` | in | 2 | Mode select (see table below) |
| `par_input` | in | 8 | Parallel data in (for the load mode) |
| `ser_input` | in | 1 | Serial data in (fills the vacated bit on shifts) |
| `par_output` | out | 8 | Parallel data out (current register value) |
| `ser_output` | out | 1 | Serial data out (bit shifted out) |

### Operating Modes

| `ctrl` | Mode | What happens |
|---|---|---|
| `00` | Hold | `par_output` and `ser_output` keep their values |
| `01` | Shift left | `par_output <= {par_output[6:0], ser_input}`; `ser_output <= par_output[7]` |
| `10` | Shift right | `par_output <= {ser_input, par_output[7:1]}`; `ser_output <= par_output[0]` |
| `11` | Parallel load | `par_output <= par_input` |

On `rstn = 0` the outputs are cleared asynchronously (`par_output = 0`, `ser_output = 0`).

### Testbench Flow (`tb_Shift_Register.sv`)

The testbench drives a 10 ns period clock (`#5` half-period toggle) and walks the DUT through every mode:

1. Assert reset (`rstn = 0`) for 10 ns, then release.
2. **Hold** mode with `par_input = 8'b01010101`, `ser_input = 1`.
3. **Shift left** for 4 clock cycles.
4. **Shift right** for 4 clock cycles.
5. **Parallel load** of `0x55` for one cycle.
6. **Asynchronous reset** in the middle of a shift-right operation.
7. **Shift left** of `0xFF` for a final sanity check.
8. `$stop`.

## Practice (not part of the submission)

Supporting files written while covering the lecture examples:

| File | Description |
|---|---|
| `Mux21.sv` | 2:1 MUX, dataflow style (`?:` ternary) |
| `Mux21(Case-Statement).sv` | 2:1 MUX, behavioral style using `case` |
| `Mux21(If-else).sv` | 2:1 MUX, behavioral style using `if`/`else` |
| `Flip_flop_AsynchronousReset.sv` | D flip-flop, async reset (`always_ff @(posedge clk, negedge rstn)`) |
| `Flip_flop_SynchronousReset.sv` | D flip-flop, sync reset (`always_ff @(posedge clk)`) |
| `Latch.sv` | Level-sensitive D latch |
| `Counter.sv` | Simple counter |
| `tb_Flipflop.sv` | Testbench for the flip-flop practice modules |

These files are **not** part of the submission; they are kept as learning material and are not individually documented here beyond the table above.

## ModelSim Flow

1. Open the project: `Exercise 2.mpf`
2. Add the two submission files (Add → Existing File):
   - `Submission/Shift_Register.sv`
   - `Submission/tb_Shift_Register.sv`
3. **Compile All**.
4. **Simulate → Start Simulation** and pick `tb_shift_register` as the top-level unit.
5. **Add Wave → All items in region** to populate the waveform window.
6. `run -all` and verify that every operating mode in the table above behaves correctly, including the mid-run asynchronous reset.
