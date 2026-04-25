# RISC-V Multicycle Processor Controller

## Project Overview
This repository contains a hierarchical SystemVerilog implementation of a **Multicycle RISC-V Controller**, developed as part of the **ELE432 Digital Design Laboratory** course at **Hacettepe University**. 

The design manages the control flow for a subset of the RISC-V Instruction Set Architecture (ISA), including:
* **R-type:** add, sub, and, or, slt
* **I-type:** lw, addi
* **S-type:** sw
* **B-type:** beq
* **J-type:** jal

## Design Hierarchy
The controller is decomposed into three main functional units to ensure modularity and efficient hardware mapping:

1.  **Main FSM (`mainfsm.sv`):** A 12-state finite state machine that coordinates the multicycle execution stages (Fetch, Decode, Execute, Memory Access, and Write-Back).
2.  **ALU Decoder (`aludec.sv`):** Logic that translates the `ALUOp` from the FSM and instruction bitfields (`funct3`, `funct7b5`) into specific `ALUControl` signals.
3.  **Instruction Decoder (`instrdec.sv`):** Decodes the opcode to determine the immediate source selection (`ImmSrc`).
4.  **Top-Level Controller (`controller.sv`):** The structural module that instantiates the sub-modules and implements the PC-Write logic gate.

## Verification Results
The design was verified using **Questa Intel FPGA Edition** with a provided testbench and a vector-based verification file (`controller.tv`).

* **Functional Success:** The controller successfully passed all **40 test vectors** with **0 errors**.
* **Signal Integrity:** Waveform analysis confirmed that control signals such as `RegWrite`, `MemWrite`, and `IRWrite` are asserted at the correct clock cycles as per the RISC-V multicycle microarchitecture.
* **Deterministic Logic:** All "don't care" outputs were set to deterministic values (0) to ensure consistent and simplified testing.

## Technical Debugging Summary
Key challenges addressed during the debugging phase included:
* **Signal Packing:** Ensuring the output port order in `controller.sv` matched the testbench's concatenation order exactly.
* **JAL Write-Back:** Implementing a dedicated state to assert `RegWrite` during the final cycle of the Jump and Link instruction.
* **Deterministic ImmSrc:** Resolving unknown (`x`) values by assigning `00` to `ImmSrc` during R-type execution to satisfy testbench comparisons.

## How to Run
1.  Clone the repository and add the `.sv` files to your Questa/ModelSim project.
2.  Ensure `controller.tv` is in the same directory as the simulation files.
3.  Compile all modules: `vlog *.sv`.
4.  Run the simulation: `vsim work.testbench`.
5.  Execute: `run -all`.

## Author
**Muzeyyen Beyza Tutak** Student ID: 2210357069  
Hacettepe University  
Department of Electrical and Electronics Engineering 
