# 🧲 Magnetic Levitation Control System — Modern Control Systems Project

This project implements **modeling**, **linearization**, and **control system design** for a **Magnetic Levitation (MagLev)** system — a classic nonlinear and inherently unstable system. The project is completed in **two phases**, covering both fundamental analysis and advanced controller design.

---

## 📌 Project Overview

Magnetic levitation is a method of using magnetic fields to **counteract gravity** and suspend an object (iron ball) in mid-air. This system is similar to the technology used in **MagLev trains**, where frictionless motion enables very high speeds.

The system under study consists of:
- A **coil** wrapped around a magnetic core  
- An **iron ball** positioned below the coil  
- An applied **input voltage** to control the current and consequently the magnetic force  

The **control objective** is to regulate and stabilize the vertical position of the iron ball.

---

## 🧮 System Model

The nonlinear state-space equations of the magnetic levitation system are:

$$
\dot{x}_1 = x_2
$$

$$
\dot{x}_2 = -g + \frac{c}{M} \frac{x_3^2}{0.1 - x_1} - \frac{f_v}{M} x_2
$$

$$
\dot{x}_3 = \frac{1}{L}(-R x_3 + u)
$$

$$
y = x_1
$$


### 📊 Parameters

| Parameter | Description                      | Value      |
|-----------|-----------------------------------|-----------|
| R         | Total circuit resistance          | 50 Ω      |
| L         | Coil inductance                   | 0.2 H     |
| g         | Gravitational acceleration        | 9.8 m/s²  |
| M         | Mass of iron ball                 | 0.425 kg  |
| c         | Electromagnetic force constant    | 0.3 N·m/A² |
| f_v       | Air friction coefficient          | 0.04 N·s/m |
| y*        | Operating point (position)        | 0.06 m    |

---

## 🧭 Phase 1 — Modeling & Classical Control

1. Find the **equilibrium points**.  
2. **Linearize** the system and derive the state-space model.  
3. Perform **stability analysis** using eigenvalues.  
4. Check **controllability**, **observability**, and **minimal realization**.  
5. Compute **state transition matrix**.  
6. Derive **transfer function** and identify **poles and zeros**.  
7. Design a **PID controller**, discuss issues, and simulate step responses.  
8. Test the **nonlinear system** with PID in Simulink.

---

## ⚡ Phase 2 — State-Feedback & Observer Design

1. Design **state-feedback controllers** for fast and slow poles, compare performance.  
2. Add **disturbances**, evaluate robustness.  
3. Investigate **integral control**, design and simulate.  
4. Implement **full-order Luenberger observer**.  
5. Implement **reduced-order observer**.

---

## 🧰 Tools & Technologies

- MATLAB / Simulink  
- Control System Toolbox  
- State-space analysis, pole placement, observer design

---

## 📂 Repository Structure
├── README.md
├── docs/
│ └── Project_Report.pdf
├── src/
│ ├── phase1/
│ └── phase2/
├── simulink/
│ ├── vrmaglev_sys.slx
│ └── controllers/
└── results/
├── linear_responses/
└── nonlinear_responses/


---

## 🚀 How to Run

1. Open `vrmaglev_sys.slx` in Simulink.  
2. Load parameter values into the MATLAB workspace.  
3. Run **Phase 1** scripts to linearize, design PID, and simulate.  
4. Run **Phase 2** scripts to implement state-feedback and observers.  
5. View simulation results and 3D visualization in Simulink.

---

## ✍️ Author

- **Mober**  
  Modern Control Systems Project (2024–2025)

## 📂 Repository Structure

