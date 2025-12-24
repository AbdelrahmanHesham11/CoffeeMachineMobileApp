# Bluetooth-Controlled Coffee Machine 

## Graduation Project – A+  
**Technologies:** Flutter, Dart, Arduino Uno, HC-05 Bluetooth Module, Relay Module  

---

## Overview
This project was developed as my **graduation project** and received an **A+ grade**.  
It is an automated coffee machine controlled via a **mobile application** using **Bluetooth communication**.

The core idea was to build a simple, reliable interface that allows a user to **start or stop the coffee brewing process** by sending a signal (`1` or `0`) from a Flutter mobile app to an **HC-05 Bluetooth module**, which then communicates with an **Arduino Uno** controlling the coffee machine through a relay.

Although the interface is intentionally minimal, the project required deep problem-solving across **hardware integration, mobile development, and system safety**.

---

## Main Functionality
- Mobile application connects to **HC-05 Bluetooth module**
- Sends binary signals:
  - `1` → Start brewing
  - `0` → Stop / power off
- Arduino processes the signal and controls the coffee machine via a **single-channel relay**
- Automatic safety shutdown after **40 seconds** to prevent overheating or electrical damage

---

## Project Architecture
**Mobile App (Flutter)**
- Bluetooth connection
- Simple user interface
- Sends control signals (`0 / 1`)
- Additional features:
  - Two-factor authentication
  - Dynamic AI assistant (experimental feature)

**Hardware Layer**
- Arduino Uno
- HC-05 Bluetooth module
- Single-channel relay
- Coffee machine with a single physical button (chosen for simplicity)

---

## Development Journey

### Step 1: Proof of Concept
I began by building a prototype using:
- Arduino Uno
- HC-05 Bluetooth module
- LED bulb
- Bluetooth Terminal mobile app

This allowed me to verify Bluetooth communication by controlling the LED remotely.

---

### Step 2: Hardware Integration
A coffee machine with a **single on/off button** was selected to simplify control logic.  
Since no wiring blueprint was available, each wire’s function had to be identified manually.

With the help of my friend **Abdelrahman Hassan**, we:
- Identified the correct control wires
- Integrated the relay safely
- Ensured proper grounding

The system successfully operated using Bluetooth commands.

---

### Step 3: Mobile Application Development
The mobile app was modified to send control signals directly to the HC-05 module.

Challenges faced:
- Outdated Flutter libraries
- Missing Bluetooth functions that required **manual implementation**

Solutions:
- Custom Bluetooth handling logic
- Binary signal protocol (`0 / 1`)
- Arduino safety logic to auto-shut down after 40 seconds

---

### Step 4: Physical Design
To improve aesthetics and safety:
- A **custom 3D-printed cover** was designed
- All electronics and wiring were concealed
- The design ensured no interference with machine operation

---

## Safety Considerations
- Automatic shutdown after 40 seconds
- Proper relay grounding
- Controlled current flow to prevent wire or heat pipe damage

---

## Firebase & Configuration
Firebase configuration files have been **intentionally removed** from this repository.


