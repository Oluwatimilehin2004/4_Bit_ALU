4-bit ALU Design and Simulation in VHDL
Project Overview
This repository contains the VHDL implementation of a 4-bit Arithmetic Logic Unit (ALU), a fundamental component of digital systems capable of performing arithmetic and logical operations. The project includes a comprehensive testbench to verify functionality, making it a valuable demonstration of digital design and verification skills for VLSI engineering.
Features

Operations Supported:
Arithmetic: Addition, Subtraction
Logical: AND, OR, XOR, NOT


Inputs:
Two 4-bit operands (A, B)
3-bit operation select signal (OP)


Outputs:
4-bit result (Result)
Zero flag (Zero) set to '1' when the result is "0000"


Optimization: Designed with a focus on modularity and efficient logic implementation.
Verification: Includes a testbench covering all operations with assertions for automated output checking.

Files

ALU_4bit.vhd: VHDL code for the 4-bit ALU entity and architecture.
ALU_4bit_tb.vhd: Testbench for simulating and verifying the ALU's functionality.

Getting Started
Prerequisites
To simulate this project, you need a VHDL simulator. Recommended tools:

ModelSim (commercial, industry-standard)
Vivado Simulator (free with Xilinx Vivado, ideal for FPGA synthesis)
GHDL (free, open-source, pair with GTKWave for waveforms)
EDA Playground (free, browser-based, no installation needed)

Simulation Instructions

Using EDA Playground (Online):
Navigate to EDA Playground.
Create a new project and select VHDL as the language.
Upload ALU_4bit.vhd and ALU_4bit_tb.vhd.
Choose a simulator (e.g., ModelSim or GHDL).
Set simulation time to at least 70 ns.
Run the simulation and view waveforms or console output.


Using Local Tools (e.g., ModelSim):
Open ModelSim or your preferred tool.
Compile both ALU_4bit.vhd and ALU_4bit_tb.vhd.
Start simulation with the testbench (ALU_4bit_tb).
Run for 70 ns to cover all test cases.
View waveforms for A, B, OP, Result, and Zero.


Verification:
The testbench includes assertions to check outputs.

Expected results:

| Test Case                 | A    | B    | OP  | Expected Result | Zero |
|---------------------------|------|------|-----|-----------------|------|
| Addition (3 + 1)          | 0011 | 0001 | 000 | 0100            | 0    |
| Subtraction (4 - 2)       | 0100 | 0010 | 001 | 0010            | 0    |
| AND (1100 AND 1010)       | 1100 | 1010 | 010 | 1000            | 0    |
| OR (1100 OR 1010)         | 1100 | 1010 | 011 | 1110            | 0    |
| XOR (1100 XOR 1010)       | 1100 | 1010 | 100 | 0110            | 0    |
| NOT (NOT 1100)            | 1100 | 0000 | 101 | 0011            | 0    |
| Zero flag test (2 - 2)    | 0010 | 0010 | 001 | 0000            | 1    |

Output
![image alt](https://github.com/OmShirse/4_Bit_ALU/blob/394231ed403d7dea82b9ca6d08c8ef0ae826277f/ALU%204bit%20Output.png)

 
Achievements

Successfully simulated using EDA Playground with Aldec Riviera Pro, verifying correct functionality and Zero flag behavior across all 7 test cases.

Future Improvements

Add support for additional operations (e.g., shift, increment).
Optimize for area and power by reducing gate count or switching activity.
Extend to 8-bit or 16-bit ALU for scalability.
Synthesize and implement on an FPGA (e.g., Xilinx Spartan-6).

****
