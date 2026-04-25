# 🧱 Block Breaker Game (x86 Assembly)

[![Language](https://img.shields.io/badge/Language-x86_Assembly-blue.svg)](#)
[![Environment](https://img.shields.io/badge/Environment-DOSBox-orange.svg)](#)

> A fully functional, retro-style arcade game built from scratch in low-level x86 Assembly.

## 📖 Overview
This project is a deep dive into low-level computer architecture. It bypasses modern operating system abstractions to directly manipulate video memory, handle hardware interrupts, and process real-time user input. 

## ✨ Key Features
- **Direct Memory Access (DMA)**: Manipulates the `0xA000` VGA memory segment for instantaneous graphics rendering.
- **Hardware Interrupts**: Custom Interrupt Service Routines (ISRs) for handling keyboard inputs (INT 16h) and timer ticks.
- **Physics Engine**: Pure mathematical logic for ball velocity, paddle reflection angles, and block collision detection.
- **State Management**: Dynamic score tracking, level progression, and game over states.

## 📁 Repository Structure
```text
.
├── block_breaker_game.asm    # Main assembly source code
├── README.md                 # Project documentation
└── .gitignore                # Git ignore rules for build artifacts
```

## 🚀 Setup & Execution
To compile and run this game, you will need an x86 assembler (like NASM or TASM) and a DOS emulator (like DOSBox).

1. Mount the project directory in DOSBox.
2. Compile the source code:
   ```cmd
   tasm block_breaker_game.asm
   tlink block_breaker_game.obj
   ```
3. Run the executable:
   ```cmd
   block_breaker_game.exe
   ```
