This repo is a Garmin Connect IQ watch-face project. You are an engineering agent collaborating with the human. Make small, correct, testable changes with a clean build and simulator verification whenever practical.

## Hard Requirements

- Read `AGENTS.md` first. Read `AGENTS.project.md` before changing product behavior, architecture, tooling, device support, permissions, publishing, or release behavior.
- Keep changes small and focused. No broad rewrites unless explicitly requested.
- Keep the build clean. Treat compiler warnings, resource warnings, and device-compatibility warnings as blocking.
- Use official Garmin Connect IQ tooling: SDK Manager, Connect IQ SDK, Monkey C, the simulator, and the Garmin Monkey C VS Code extension.
- Target the Garmin fēnix 6X Pro Solar first unless the user explicitly asks to add more devices.
- Preserve watch battery life. Avoid unnecessary redraws, network calls, sensors, background work, or high-frequency updates.
- Preserve display legibility on the fēnix 6X Pro Solar 280 x 280 round Memory-In-Pixel display with 64 colors.
- Keep privacy first. Do not add permissions, telemetry, analytics, location, web requests, or user-data collection unless explicitly approved.
- Do not commit developer keys, Garmin account credentials, generated `.prg` / `.iq` packages, simulator caches, or build artifacts.
- Prefer plain, local setup instructions over hidden machine-specific assumptions.

## Workflow

1. Inspect only the files needed for the task.
2. Make a brief plan for non-trivial changes.
3. Implement the smallest safe patch.
4. Run the narrowest useful validation.
5. Report files changed, validation performed, remaining risks, and anything skipped.
6. Commit or publish only when the user asks.

## Connect IQ Guidance

- Prefer generated Garmin project structure and standard Connect IQ conventions.
- Keep Monkey C source focused and readable; use helpers only when they clarify real behavior.
- Keep draw code efficient. Avoid repeated allocation or expensive calculations inside render/update paths.
- Use resource XML, layouts, fonts, bitmaps, and settings files deliberately; avoid ad hoc generated assets unless they are part of the requested feature.
- Keep app settings simple and compatible with Garmin Connect IQ Store / Garmin Connect / Garmin Express.
- Keep device identifiers and API levels explicit once the SDK project is created.
- Use simulator testing before real-watch installation.
- Test real watch installation before calling a face device-ready.

## Design Baseline

- Design for glanceability outdoors, not phone-like density.
- Prefer strong contrast, large readable numerals, and restrained use of the 64-color palette.
- Avoid tiny text, decorative clutter, and animations that fight the MIP display.
- Show status with text or clear icons, not color alone.
- Respect round-screen safe areas and avoid clipping at the bezel.
- If adding configurable fields, keep defaults useful without requiring setup.

## Validation

Use the smallest validation that proves the changed contract:

- Tooling/setup changes: verify `code`, Java, the Monkey C extension, and Connect IQ command-line tools where available.
- Source/resource changes: build with `monkeyc` for the fēnix 6X Pro Solar target once the SDK/device is installed.
- Simulator-visible changes: run in the Connect IQ simulator and inspect the affected watch face state.
- Real-device changes: install the built `.prg` on the watch only when the user wants device verification.
- Documentation-only changes: proofread the touched docs; no app build is required unless requested.

If validation cannot run, state the exact missing prerequisite or failure.

## Do Not

- Do not introduce third-party libraries without approval.
- Do not broaden device support casually; each added device must be checked for resolution, API level, memory, and color/display constraints.
- Do not add permissions just because an API is available.
- Do not make claims about Garmin Store readiness without checking Garmin review requirements.
- Do not use copyrighted brand artwork, logos, or cloned commercial watch faces unless the user confirms rights and intent.
- Do not hide build, simulator, or install failures.

When something is ambiguous, choose the simplest official Connect IQ path that preserves battery life, legibility, privacy, and source-control cleanliness.
