RISC-V Multicycle Processor Controller
Project Overview
This repository contains the SystemVerilog implementation of a Multicycle RISC-V Controller. The design was developed as part of the ELE432 Digital Design Laboratory course at Hacettepe University. The objective of this project is to design a control unit that manages the execution flow of various RISC-V instructions—including R-type, I-type (lw, addi), S-type (sw), B-type (beq), and J-type (jal)—across multiple clock cycles .
Design Hierarchy
The controller is designed using a hierarchical approach to ensure modularity and ease of debugging. It consists of the following sub-modules:
•	Main FSM (mainfsm.sv): A finite state machine that generates state-dependent control signals (Fetch, Decode, Execute, Write-Back) .
•	ALU Decoder (aludec.sv): Generates the ALUControl signal based on ALUOp and instruction bitfields (funct3, funct7b5).
•	Instruction Decoder (instrdec.sv): Determines the immediate source (ImmSrc) selection logic based on the opcode.
•	Top-Level Controller (controller.sv): The top-level module that instantiates the sub-modules and handles final PC-write logic.
Verification
The design was verified using Questa Intel FPGA Edition and a provided testbench with a vector file (controller.tv) .
•	Test Results: The implementation successfully passed all 40 test vectors with 0 errors, confirming the logical accuracy of the FSM transitions and control signal generation.
•	Timing: Control signals were verified on the falling edge of the clock to ensure stability and proper synchronization with the datapath .
Tools Used
•	Quartus Prime: For synthesis and hardware mapping.
•	Questa/ModelSim: For RTL simulation and waveform analysis.
•	SystemVerilog: Hardware Description Language (HDL).
How to Run
1.	Add all .sv files and the controller.tv file to your Questa/ModelSim project directory .
2.	Compile all files.
3.	Load the simulation: vsim work.testbench.
4.	Run the simulation: run -all.
5.	Check the transcript for the "0 errors" confirmation.
Author
Müzeyyen Beyza Tutak Student ID: 2210357069
Hacettepe University
Department of Electrical and Electronics Engineering 
