# Wasl Al-Muslim (وصل المسلم)

A premium, production-ready Islamic athkar application for iOS and Android built with Flutter.

## Overview
Wasl Al-Muslim features a beautiful, clean, and Arabic-first modern UI. It manages athkar through local data, offers tasbeeh counters, detailed categories, system settings (font size controls), search capabilities, local notifications for reminders, and bookmarking functionality.

## Features
- Splash & Onboarding Flow
- Arabic-first RTL Native Application
- Categorized Athkar (Morning, Evening, Sleep, Wake Up, Prayer, etc.)
- Tasbeeh Counter with Saved Progress
- Customizations: Font size adjustments & dark mode support
- App Notifications / Reminders Engine
- Real-time Search Integration
- Favorites (Bookmarking)
- Clean Architecture (Feature-driven)

## Folder Structure
```
lib/
  app/            - App entry point and go_router definitions
  core/           - Constants, themes, generic widgets, and shared utilities
  l10n/           - Application localization definitions
  features/
    about/        - About developer/app screen
    athkar/       - Athkar reading, detail views, and progress tracking
    categories/   - Athkar category listings
    favorites/    - Bookmarks and saved items
    home/         - Beautiful dashboard with quick access links
    onboarding/   - Introduction flow to the app
    search/       - Search athkar
    reminders/    - Local notification settings and scheduling
    settings/     - App-wide preferences
    splash/       - Initial loading view
    tasbeeh/      - Digital tasbeeh feature
    prayer_times/ - Architecture placeholder for prayer times
    qibla/        - Architecture placeholder for qibla compass
main.dart         - Root bootstrap
```

## Running Locally

1. `flutter pub get`
2. `flutter gen-l10n`
3. `flutter run`

## Building

- Android: `flutter build apk --release` (or `appbundle`)
- iOS: `flutter build ipa --release`

## Codemagic CI/CD Connection

This repository includes a `codemagic.yaml` file in the root, configured for Android production and iOS Unsigned IPA automated builds.

1. Connect the GitHub repository to Codemagic.
2. In Codemagic settings for this app, locate **Environment variables**.
3. Create a group named `android_credentials` (if building Android).
4. **No iOS signing keys or Apple Developer accounts are required** to build the iOS IPA because the workflow generates an *unsigned* payload.

### Required Secrets (Codemagic UI)

**For Android (android_credentials):**
- `CM_KEYSTORE_PATH`
- `CM_KEYSTORE_PASSWORD`
- `CM_KEY_ALIAS`
- `CM_KEY_PASSWORD`
- `GCP_SERVICE_ACCOUNT_KEY` (For Play Store automated publishing)

### Building the iOS Application
Simply run the `iOS Unsigned IPA Workflow` in Codemagic. It will automatically build and package an unsigned `.ipa` file without querying Apple's servers.

**Warning:** The generated unsigned IPA cannot be directly installed on a standard un-jailbroken iPhone. It is meant to be signed later (e.g. via AltStore, Sideloadly) or used for emulator/sim workflows.

### Values to Replace before Production
Check and replace placeholder strings in:
1. `android/app/build.gradle` (`applicationId`)
2. App icon & Launch screen assets in `android/app/src/main/res/` and `ios/Runner/Assets.xcassets/`.
