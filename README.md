# Enhanced FSM-Based Smart Vending Machine Controller using Verilog HDL

## 📌 Project Overview

This project implements an **Enhanced Smart Vending Machine Controller** using **Verilog HDL** based on the **Moore Finite State Machine (FSM)** architecture.

The vending machine accepts ₹5 and ₹10 coins and provides additional real-world functionalities such as **transaction cancellation**, **refund**, and **change return**. The design has been functionally verified using a dedicated Verilog testbench and simulated with **Icarus Verilog** and **GTKWave**.

---

## 🚀 Features

- Moore FSM-based design
- Accepts ₹5 and ₹10 coins
- Product dispensing functionality
- Cancel transaction feature
- Refund mechanism
- Automatic ₹5 change return for excess payment
- Reset functionality
- Complete Verilog testbench
- Functional verification using GTKWave

---

## 🛠️ Tools Used

- Verilog HDL
- Icarus Verilog
- GTKWave
- Visual Studio Code
- Git & GitHub

---

## 📂 Project Structure

```
Enhanced-FSM-Vending-Machine-Verilog
│
├── vending_machine.v
├── tb_vending_machine.v
├── README.md
│
└── images
    ├── waveform.png
    └── output.png
```

---

## ⚙️ FSM States

| State | Description |
|--------|-------------|
| S0 | Idle state (Waiting for coins) |
| S5 | ₹5 inserted |
| DISPENSE | Dispenses the product |
| CHANGE | Dispenses product and returns ₹5 change |
| REFUND | Returns inserted money after cancel request |

---

## 🧪 Test Cases Verified

✔ Reset Operation

✔ ₹10 Coin → Product Dispensed

✔ ₹5 + ₹5 → Product Dispensed

✔ ₹5 + ₹10 → Product Dispensed + ₹5 Change

✔ ₹5 + Cancel → Refund

✔ Idle State Verification

---

## Learning Outcomes
-Learned Moore FSM design methodology.
-Implemented sequential logic in Verilog HDL.
-Developed and verified a complete testbench.
-Debugged the design using GTKWave.
-Used Git and GitHub for version control

## ▶️ How to Run

### Compile

```bash
iverilog -o vending vending_machine.v tb_vending_machine.v
```

### Run Simulation

```bash
vvp vending
```

### View Waveform

```bash
gtkwave vending_machine.vcd
```

---

## 📸 Simulation Results

### Output

![Output](images/output.png)

### GTKWave Waveform

![Waveform](images/waveform.png)

---

## 📈 Future Enhancements

- Multiple product selection
- Inventory management
- Out-of-stock detection
- Seven-segment display interface
- FPGA implementation
- Datapath and Controller architecture

---

## 👩‍💻 Author

**Kashish Garg**

B.Tech | Electronics & VLSI Engineering

GitHub: https://github.com/kashishgargk123-star

---
