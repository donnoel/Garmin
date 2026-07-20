# **Garmin Watch Faces**
### *Simple, readable Garmin fēnix 6X Pro Solar watch faces built with Connect IQ.*

<p align="center">
  <img src="https://img.shields.io/badge/Garmin-Connect%20IQ-007CC3">
  <img src="https://img.shields.io/badge/Language-Monkey%20C-orange">
  <img src="https://img.shields.io/badge/Target-f%C4%93nix%206X%20Pro%20Solar-blue">
  <img src="https://img.shields.io/badge/Display-280x280%20MIP-green">
</p>

---

## What is this?

**Garmin Watch Faces** is a personal Connect IQ project for building simple custom watch faces for the Garmin fēnix 6X Pro Solar.

The goal is not to make a flashy phone-style screen. The goal is a small set of practical watch faces that are:

- easy to read outdoors,
- battery-conscious,
- useful at a glance,
- built for the fēnix 6X Pro Solar's 280 x 280 round Memory-In-Pixel display,
- simple enough to test, wear, and improve.

The first target is a Garmin fēnix 6X Pro Solar. Additional Garmin devices can be added later after the first face is stable.

---

## First Watch Face Goals

| Goal | Description |
|------|-------------|
| **Readable Time** | Large, clear time remains the visual anchor. |
| **Outdoor Friendly** | Strong contrast and restrained colors for the MIP display. |
| **Battery Aware** | Avoid unnecessary redraws, sensors, animations, and background behavior. |
| **Useful Data** | Start with practical fields like date, battery, steps, and heart rate where available. |
| **Simple Defaults** | The face should be useful without requiring setup. |
| **Simulator First** | Build and inspect in the Connect IQ simulator before installing on the real watch. |

---

## Design Constraints

- Primary device: **Garmin fēnix 6X Pro Solar**
- Display: **280 x 280 round Memory-In-Pixel**
- Color constraint: **64 colors**
- Connect IQ compatibility target: **fēnix 6X Pro Solar first**

Design choices should favor clarity over decoration. Tiny labels, dense dashboards, AMOLED-style gradients, and constant animation are intentionally avoided.

---

## Toolchain

Expected tools:

- Garmin Connect IQ SDK Manager
- Garmin Connect IQ SDK
- Connect IQ Simulator
- Visual Studio Code
- Garmin Monkey C VS Code extension
- Java runtime
- Garmin developer key for local signing

Useful commands after the SDK is installed and available on `PATH`:

```bash
connectiq
monkeyc
monkeydo
```

The SDK Manager may require Garmin login, license acceptance, SDK download, and device-support download before these commands are available.

---

## Project Structure

This repo is still in bootstrap. Once the Connect IQ project is generated, the expected shape is:

```text
Garmin/
├── manifest.xml
├── monkey.jungle
├── source/
├── resources/
├── docs/
├── AGENTS.md
├── AGENTS.project.md
└── README.md
```

Generated build output, signed packages, developer keys, and local credentials should stay out of git.

---

## Getting Started

### Requirements

- macOS
- Visual Studio Code
- Garmin Monkey C VS Code extension
- Java runtime
- Garmin Connect IQ SDK Manager
- fēnix 6X Pro Solar device support installed through SDK Manager

### Setup

1. Install Garmin Connect IQ SDK Manager.
2. Use SDK Manager to install the latest Connect IQ SDK.
3. Use SDK Manager to install fēnix 6X Pro Solar device support.
4. Install the Garmin Monkey C extension in VS Code.
5. Generate or configure a Garmin developer key.
6. Create a Connect IQ **Watch Face** project targeting fēnix 6X Pro Solar.
7. Build and run the watch face in the Connect IQ simulator.

---

## Build and Run

The exact build command depends on the generated project and installed SDK paths. Once generated, the normal workflow is:

1. Build the watch face with `monkeyc`.
2. Launch the Connect IQ simulator with `connectiq`.
3. Run the built app in the simulator with `monkeydo`.
4. Install the signed `.prg` on the physical watch only after simulator verification.

Until the Connect IQ project exists, validation is limited to documentation and toolchain checks.

---

## Privacy and Permissions

The starting point is no special permissions.

Future watch faces should add permissions only when a specific feature requires them. Location, web requests, telemetry, analytics, account systems, and user-data collection are out of scope unless explicitly approved.

---

## Troubleshooting

- **Monkey C commands are missing**
  - Open SDK Manager, install the SDK, install device support, and verify the SDK path used by the VS Code extension.

- **Simulator does not show the target device**
  - Install fēnix 6X Pro Solar device support through SDK Manager.

- **Build asks for a private key**
  - Generate a Garmin developer key and store it outside the repository.

- **Watch face looks cramped**
  - Recheck the 280 x 280 round display constraints and simplify the layout before adding more fields.

---

## Roadmap

- [ ] Finish local Connect IQ SDK Manager setup.
- [ ] Generate the first Garmin watch-face project.
- [ ] Build the first fēnix 6X Pro Solar simulator face.
- [ ] Design a clean time/date/battery/steps layout.
- [ ] Add optional heart-rate or outdoor-focused data fields where appropriate.
- [ ] Install and smoke test on the real watch.

---

## Credits

Built with care by **Don Noel** and AI collaboration.

---

> *This project is about making Garmin watch faces that are simple enough to trust every day.*
