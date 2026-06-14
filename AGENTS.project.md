# AGENTS.project.md

# Garmin Watch Face Project Guide for Agents

## Product Intent

This project is for building custom Garmin Connect IQ watch faces, starting with Don's Garmin fēnix 6X Pro Solar.

The first product goal is a personal, reliable, battery-friendly watch face that is easy to read outdoors and useful at a glance. It should feel designed for the fēnix 6X Pro Solar hardware rather than copied from AMOLED or phone UI patterns.

## Current Product Phase

The project is in bootstrap.

Current scope:
- Install and verify the local Connect IQ toolchain.
- Create a Garmin watch-face project.
- Target fēnix 6X Pro Solar first.
- Build and run in the Connect IQ simulator.
- Install manually on the physical watch when ready.

Explicitly out of scope until requested:
- Public Connect IQ Store submission.
- Monetization, trials, payments, or licensing.
- Cloud services, companion mobile apps, accounts, analytics, or telemetry.
- Medical, diagnostic, coaching, or safety-critical claims.
- Cloning Garmin stock faces or third-party commercial faces.
- Broad multi-device support before the fēnix 6X Pro Solar face is stable.

## Target Device

Primary device:
- Garmin fēnix 6X Pro Solar.
- Display: 280 x 280 round Memory-In-Pixel.
- Color constraint: 64 colors.
- Connect IQ generation: 3.4-era compatibility according to Garmin's compatible device listing.

Design implications:
- Large readable time is the anchor.
- Use simple shapes, clear spacing, and high contrast.
- Avoid AMOLED-style gradients, tiny data fields, and animation-heavy designs.
- Treat daylight readability and battery life as core product requirements.

## Toolchain Snapshot

Expected local tools:
- Visual Studio Code.
- Garmin Monkey C VS Code extension.
- Java runtime for Garmin tooling.
- Garmin Connect IQ SDK Manager.
- Garmin Connect IQ SDK.
- fēnix 6X Pro Solar device support installed through SDK Manager.
- Connect IQ Simulator.
- Developer key for signing local builds.

Common commands after the SDK is installed and on `PATH`:
- `connectiq` launches the simulator.
- `monkeyc` builds a Connect IQ app/watch face.
- `monkeydo` runs a built app in the simulator.

Do not assume command paths are stable until the SDK Manager setup is complete. Prefer verifying the active SDK and device identifier from the installed SDK.

## Expected Repository Shape

Use Garmin's generated project structure unless there is a strong reason not to.

Likely files and folders:
- `manifest.xml`: app metadata, type, permissions, and target products.
- `monkey.jungle`: build configuration.
- `source/`: Monkey C source files.
- `resources/`: layouts, drawables, strings, fonts, bitmaps, properties, and settings.
- `bin/`: generated build output, ignored by git.
- `.vscode/`: optional project-local VS Code settings/tasks when they improve repeatable builds.
- `docs/`: design notes, setup notes, device-install notes, and future submission notes.

## Behavior Invariants

Do not regress these contracts:
- Watch face must build without warnings for the primary fēnix 6X Pro Solar target.
- The face must remain legible on the real 280 x 280 MIP display.
- Time display must remain reliable and visually dominant unless the user asks for a non-time-first concept.
- Redraw behavior must be battery-conscious.
- Any data fields must degrade gracefully when data is unavailable or permission is not granted.
- No unexpected permissions, network access, telemetry, or user-data storage.
- Settings changes must preserve a valid, readable default state.
- Generated packages and private signing keys must stay out of source control.

## Product Direction

Initial watch-face concepts should favor:
- Clean time/date layout.
- Battery status.
- Steps or goal progress.
- Heart rate where available and appropriate.
- Sunrise/sunset or outdoor-relevant information if supported without excessive cost.
- Solar/outdoor design language that works within the MIP palette.

Keep the first face simple enough to finish, test, and wear.

## Coding Rules

- Prefer straightforward Monkey C over clever abstractions.
- Keep rendering and data-fetching responsibilities clear.
- Avoid allocating repeatedly in update/draw paths.
- Cache static geometry, colors, labels, and layout decisions where practical.
- Keep settings parsing defensive.
- Keep resource names descriptive and consistent.
- Use Garmin APIs through documented Connect IQ modules only.
- Add comments only where a Garmin API constraint or display workaround is not obvious.

## Privacy And Permissions

- Start with no special permissions unless a feature truly needs them.
- Explain every added permission in project docs and user-facing store text if publishing later.
- Do not add location, web requests, sensors, or background behavior without explicit approval.
- If a data field can be unavailable, render an honest placeholder rather than failing or hiding the problem.

## Build And Validation Notes

Until the project is generated, validation is limited to toolchain checks and documentation proofing.

After project creation, expected validation is:
- Verify the Monkey C extension can find the active SDK.
- Build the watch face for the fēnix 6X Pro Solar target with `monkeyc`.
- Run the face in the Connect IQ simulator with `monkeydo`.
- Inspect normal, low-power, and unavailable-data states where applicable.
- For device testing, copy the signed `.prg` to the watch only when intentionally doing a real-watch smoke.

If the SDK Manager requires Garmin login, license acceptance, or GUI setup, report that clearly and pause for the human step.

## Publishing Notes

Do not prepare a public Connect IQ Store submission unless requested.

Before any submission work:
- Review Garmin Connect IQ app review guidelines.
- Confirm app name, icon, screenshots, description, privacy policy needs, permissions, and supported devices.
- Verify that all artwork, fonts, and design references are licensed for distribution.
- Test on the target watch and simulator.

## Output Expectations Per Patch

Provide:
- Summary of change.
- Files created or modified.
- Toolchain or setup impact.
- What works now.
- What remains unimplemented or unverified.
- Validation performed.
- Real-watch status when relevant.
- Commit message suggestion.
