# Smart Parking Lot Controller (Verilog & FPGA)

A digital parking lot management system designed in **Verilog HDL** and implemented on the **Digilent Basys 3 (Artix-7) FPGA board**. 

The system counts incoming and outgoing vehicles, manages available space, and provides visual indicators via LEDs and a 4-digit 7-segment display.

## Key Features
* **Finite State Machine (FSM):** Structured 3-state control logic (`EMPTY`, `AVAILABLE`, `FULL`).
* **Hardware Debouncing & Edge Detection:** Synchronized button filtering running on a divided 1kHz clock to prevent contact bounce and multi-triggering.
* **Efficient Output Separation:** Sequential logic for tracking car count and fully combinational logic for driving the peripheral displays (avoiding unintended latches).
* **Multiplexed 7-Segment Display Driver:** Active-low dynamic translation for accurate digital car tracking (0-9).

## Project Architecture
The design follows a top-down structural methodology:
1. `parking_top.v` - Main structural module connecting all sub-blocks.
2. `clk_div.v` - Frequency divider generating a stable 1kHz clock from the onboard 100MHz source.
3. `debouncer.v` - Edge-detecting debouncer ensuring single-increment updates.
4. `parking_logic.v` - The FSM core tracking current occupancy.
5. `seven_seg_driver.v` - An active-low BCD-to-7-segment decoder.

## How to Run
1. Clone the repository and add the files in the `src/` directory to a new Xilinx Vivado project.
2. Target the **Artix-7 (xc7a35tcpg236-1)** FPGA.
3. Import `basys3_constraints.xdc` for full pin mapping.
4. Generate Bitstream and program the Basys 3 board.
