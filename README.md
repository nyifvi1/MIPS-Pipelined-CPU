# VHDL Implementation of a 5-Stage Pipelined MIPS CPU

This project presents a hardware implementation of a **pipelined MIPS processor**, based on a classic 5-stage architecture:  
**Instruction Fetch (IF), Instruction Decode (ID), Execute (EX), Memory Access (MEM), Write Back (WB)**.

The processor is implemented in VHDL and supports basic instruction forwarding and hazard detection to handle data dependencies and control flow changes. It is suitable for both simulation and FPGA deployment using Intel Quartus.

---

## Design Overview

The core of the processor is constructed in a modular fashion. Each major pipeline stage is encapsulated in a dedicated VHDL file, with support logic for control, forwarding, and stalling integrated into the system.

### Major Components:

- **MIPS.vhd** – The top-level file orchestrating all pipeline stages and control units.
- **IFETCH.vhd** – Handles PC logic and instruction memory interface.
- **IDECODE.vhd** – Reads register operands and decodes instruction fields.
- **EXECUTE.vhd** – Performs ALU operations and handles shift instructions.
- **DMEMORY.vhd** – Interfaces with the data memory for `lw` and `sw`.
- **CONTROL.vhd** – Control unit that decodes opcodes and generates internal control signals.
- **ForwardingUnit.vhd** – Resolves data hazards using operand forwarding.
- **HazardUnit.vhd** – Detects load-use hazards and stalls the pipeline accordingly.
- **Shifter.vhd** – Performs logical shift operations.
- **PLL.vhd** – PLL instance for clock management during FPGA deployment.
- **VHDL packages** – Shared constants, macros, and types are defined in `aux_package.vhd`, `const_package.vhd`, and `cond_comilation_package.vhd`.

---

## Simulation

Simulation is done using ModelSim. The testbench (`tb_sc_mips.vhd`) loads sample programs and monitors processor behavior across cycles.

Simulation resources:
- `ITCM.hex` – Instruction memory initialization.
- `DTCM.hex` – Data memory initialization.
- `wave.do` – Script for waveform visualization.

To simulate:
1. Compile VHDL source files.
2. Compile the testbench.
3. Verify that memory paths point to `/Memory files/`.
4. Run the simulation and inspect the internal signals using `wave.do`.

---

## Instruction Set

The pipelined CPU supports a limited subset of MIPS instructions, including:

- **R-type**: `add`, `sub`, `and`, `or`, `slt`, `sll`, `srl`
- **I-type**: `lw`, `sw`, `beq`, `bne`, `addi`, `andi`, `ori`
- **J-type**: `j`, `jr`, `jal`

Forwarding logic covers most RAW hazards. Load-use hazards are handled via pipeline stalling.

---

## FPGA Compilation

The processor was synthesized using Intel Quartus and tested for FPGA implementation.

Relevant files:
- `PipelinedMIPS.sof` – FPGA configuration file.
- Reports: `*.fit.rpt`, `*.sta.rpt`, `*.map.rpt`, etc.
- Constraints: `SDC1.sdc` for timing requirements.
- Clocking: implemented via `PLL.vhd`

---

## Highlights

- **Pipelined execution** improves throughput over single-cycle design.
- Includes complete hazard handling via dedicated logic units.
- Organized and readable VHDL hierarchy with synthesizable design blocks.

---
