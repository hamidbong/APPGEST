# appGEst

Simple hospital management app in Bash with a Zenity GUI.

## Overview

This project provides a menu-driven interface to manage:

- Healthcare staff (personnel soignant)
- Patients
- Rooms (salles)

Data is stored in plain `.txt` files inside project folders.

## Features

### 1) Staff management

From the main menu, you can:

- Add an employee
- Assign an employee to another block
- Change employee salary
- Delete an employee

Script: `gest_soign.sh`

### 2) Patient management

From the main menu, you can:

- Add a patient
- Delete a patient
- Move a patient to another room
- Generate a bill

Script: `gest_patient.sh`

### 3) Room management

From the main menu, you can:

- Create a room
- Delete a room

Script: `gest_salle.sh`

## Project structure

- `prog_gest.sh`: main menu and routing script
- `gest_soign.sh`: staff operations
- `gest_patient.sh`: patient operations and bill generation
- `gest_salle.sh`: room operations
- `personnel_Gest/`: saved employee files
- `patt_Gest/`: saved patient files
- `patt_Gest/les_Factures/`: generated bill files
- `salle_Gest/`: saved room files
- `sal_Gest/`: currently unused (legacy/empty folder)

## Requirements

- Linux
- Bash
- Zenity

Install Zenity (Debian/Ubuntu):

```bash
sudo apt update
sudo apt install zenity
```

## Run

1. Go to the project folder.
2. Make scripts executable:

```bash
chmod +x prog_gest.sh gest_soign.sh gest_patient.sh gest_salle.sh
```

3. Start the app:

```bash
./prog_gest.sh
```

## Data format

The app stores one text file per entity.

- Staff file name: `ID + Nom + Prenom + .txt`
- Patient file name: `ID + Nom + Prenom + .txt`
- Room file name: `NumSalle + NomSalle + Bloc + .txt`

Bills are written to `patt_Gest/les_Factures/`.

## Important path note

Current scripts use hardcoded absolute paths like:

`/home/brahbong/appGEst/...`

If your local path is different (for example `/home/brahim/Downloads/appGEst`), some actions may fail until paths are updated in scripts.

## Known limitations

- Limited input validation
- No duplicate checking
- Text replacement with `sed` may replace unintended values
- Data is plain text (no database, no locking)

## Troubleshooting

- `zenity: command not found`
  - Install Zenity.
- `Permission denied`
  - Run `chmod +x` on scripts.
- File not created/deleted
  - Check folder existence and hardcoded paths in scripts.

## Next improvements (optional)

- Replace hardcoded paths with dynamic project root detection
- Add stronger data validation
- Add unique ID checks
- Add backup/export options
