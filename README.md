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

This repository includes a `codemagic.yaml` file in the root, uniquely prepared for automatic iOS and Android deployments.

1. Connect the GitHub repository to Codemagic.
2. In Codemagic settings for this app, locate **Environment variables**.
3. Create a group named `ios_credentials`.
4. Create a group named `android_credentials`.

### Required Secrets (Codemagic UI)

**For iOS (ios_credentials):**
- `APP_STORE_CONNECT_ISSUER_ID`
- `APP_STORE_CONNECT_KEY_IDENTIFIER`
- `APP_STORE_CONNECT_PRIVATE_KEY`
- Note: Replace `BUNDLE_ID` and `APPLE_TEAM_ID` in `codemagic.yaml` with your actual Apple IDs.

**For Android (android_credentials):**
- `CM_KEYSTORE_PATH`
- `CM_KEYSTORE_PASSWORD`
- `CM_KEY_ALIAS`
- `CM_KEY_PASSWORD`
- `GCP_SERVICE_ACCOUNT_KEY` (For Play Store automated publishing)

### Preparing iOS Signing
You do not need to configure anything locally if using Codemagic's `app-store-connect` CLI built-in steps. It automatically pulls your provisioning profiles as long as the aforementioned keys are added correctly to the `ios_credentials` environment group.

### Values to Replace before Production
Check and replace placeholder strings in:
1. `codemagic.yaml` (`BUNDLE_ID`, `APPLE_TEAM_ID`)
2. `ios/Runner.xcodeproj/project.pbxproj` (Bundle identifiers)
3. `android/app/build.gradle` (`applicationId`)
4. App icon & Launch screen assets in `android/app/src/main/res/` and `ios/Runner/Assets.xcassets/`.
