# Exercise 2 — 2:1 Multiplexer and D Flip-Flops

> **Status:** in progress — work-in-progress files are at the top level of this folder; the `Submission/` and `Practice/` subfolders will be organized once the exercise is finished.

## Scope

Two small building blocks are explored in this exercise:

- A **2:1 multiplexer** written in three different coding styles, to compare how the same combinational function can be described in SystemVerilog.
- A **D flip-flop**, in both an **asynchronous reset** and a **synchronous reset** variant, to practice sequential logic and the two common reset strategies.

## Current Files

| File | Module | Style / Variant |
|---|---|---|
| `Mux21.sv` | `mux21` | Continuous assign with the ternary (`?:`) operator |
| `Mux21(Case-Statement).sv` | `mux21` | `always_comb` with a `case` statement |
| `Mux21(If-else).sv` | `mux21` | `always` with an `if/else` block |
| `Flip_flop_AsynchronousReset.sv` | `flip_flop` | `always_ff @(posedge clk, negedge rstn)` — reset reacts to its own edge, independent of the clock |
| `Flip_flop_SynchronousReset.sv` | `flip_flop` | `always_ff @(posedge clk)` — reset is sampled on the clock edge |
| `Exercise 2.mpf` | — | ModelSim project file |

## 2:1 MUX — the three styles

All three files describe the same function `out = sel ? in1 : in0`, but they illustrate different SystemVerilog constructs:

```systemverilog
// Mux21.sv — dataflow / continuous assign
assign out = sel ? in1 : in0;

// Mux21(Case-Statement).sv — behavioral case
always_comb
  case (sel)
    0: out = in0;
    1: out = in1;
    default: out = 1'bX;
  endcase

// Mux21(If-else).sv — behavioral if/else
always @(in0, in1, sel)
  if (sel == 1) out = in1;
  else          out = in0;
```

## D flip-flop — reset strategies

Both files define a module `flip_flop(clk, rstn, in, out)`; they differ in the sensitivity list of the `always_ff` block:

```systemverilog
// Asynchronous reset — reset is in the sensitivity list
always_ff @(posedge clk, negedge rstn)
  ...

// Synchronous reset — only clock in the sensitivity list;
// the reset condition is evaluated when a clock edge arrives
always_ff @(posedge clk)
  ...
```

## Next Steps

- Finalize the three MUX styles and the two FF variants.
- Write a testbench for each block.
- Reorganize the folder into `Submission/` (files to be handed in) and `Practice/` (warm-up code).
- Document the test scenarios and the expected waveforms, as done for Exercise 1.
