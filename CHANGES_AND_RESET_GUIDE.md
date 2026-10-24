# Changes and Reset Guide

This document records all modifications made to this workspace, along with instructions and a ready-to-use prompt to completely revert the project to its original state.

---

## 📋 1. Summary of Changes Made

| File | Action | Purpose / Description |
| :--- | :--- | :--- |
| [`README.md`](file:///c:/Users/syedm/OneDrive/Desktop/Projects/Project/README.md) | **Created** | Comprehensive academic project documentation with architecture diagrams, setup guide, and evaluation sections for 6th-semester presentation. |
| [`.gitignore`](file:///c:/Users/syedm/OneDrive/Desktop/Projects/Project/.gitignore) | **Created** | Prevents large files (e.g., `mnist.csv` > 100MB, `python-3.7.0-amd64.exe`, `.rar`) and cache files from causing GitHub push errors. |
| [`LICENSE`](file:///c:/Users/syedm/OneDrive/Desktop/Projects/Project/LICENSE) | **Created** | Standard MIT Open Source License. |
| [`Lomar/README.md`](file:///c:/Users/syedm/OneDrive/Desktop/Projects/Project/Lomar/README.md) | **Created** | Short submodule reference pointing to the main documentation. |
| [`Lomar/requirements.txt`](file:///c:/Users/syedm/OneDrive/Desktop/Projects/Project/Lomar/requirements.txt) | **Modified** | Removed the invalid `pip install ` prefixes from each line so standard `pip install -r requirements.txt` works properly. |
| [`CHANGES_AND_RESET_GUIDE.md`](file:///c:/Users/syedm/OneDrive/Desktop/Projects/Project/CHANGES_AND_RESET_GUIDE.md) | **Created** | This file: audit trail and reset procedure. |

---

## 🔍 2. Detailed Change Comparison

### File: `Lomar/requirements.txt`

#### Original Content:
```text
pip install numpy==1.19.2
pip install pandas==0.25.3
pip install matplotlib==3.1.1
pip install keras==2.3.1
pip install tensorflow==1.14.0
pip install h5py==2.10.0
pip install protobuf==3.16.0
pip install scikit-learn==0.22.2.post1
pip install seaborn==0.10.1
```

#### Modified Content:
```text
numpy==1.19.2
pandas==0.25.3
matplotlib==3.1.1
keras==2.3.1
tensorflow==1.14.0
h5py==2.10.0
protobuf==3.16.0
scikit-learn==0.22.2.post1
seaborn==0.10.1
```

---

## ⏪ 3. How to Reset via AI Chat (Copy-Paste Prompt)

If you ever want to revert everything back to its exact initial state, copy and paste this exact prompt into the chat:

```text
Please reset all changes made to this workspace to their original state:
1. Delete the following added files:
   - README.md (in the root directory)
   - .gitignore (in the root directory)
   - LICENSE (in the root directory)
   - Lomar/README.md
   - CHANGES_AND_RESET_GUIDE.md
2. Revert Lomar/requirements.txt back to its original lines:
pip install numpy==1.19.2
pip install pandas==0.25.3
pip install matplotlib==3.1.1
pip install keras==2.3.1
pip install tensorflow==1.14.0
pip install h5py==2.10.0
pip install protobuf==3.16.0
pip install scikit-learn==0.22.2.post1
pip install seaborn==0.10.1
```

---

## 💻 4. How to Reset Manually (PowerShell / Command Prompt)

If you prefer to revert manually using PowerShell in the project directory:

```powershell
# 1. Remove the newly created files
Remove-Item -Path ".\README.md" -Force -ErrorAction SilentlyContinue
Remove-Item -Path ".\.gitignore" -Force -ErrorAction SilentlyContinue
Remove-Item -Path ".\LICENSE" -Force -ErrorAction SilentlyContinue
Remove-Item -Path ".\Lomar\README.md" -Force -ErrorAction SilentlyContinue
Remove-Item -Path ".\CHANGES_AND_RESET_GUIDE.md" -Force -ErrorAction SilentlyContinue

# 2. Restore Lomar/requirements.txt original content
@"
pip install numpy==1.19.2
pip install pandas==0.25.3
pip install matplotlib==3.1.1
pip install keras==2.3.1
pip install tensorflow==1.14.0
pip install h5py==2.10.0
pip install protobuf==3.16.0
pip install scikit-learn==0.22.2.post1
pip install seaborn==0.10.1
"@ | Set-Content -Path ".\Lomar\requirements.txt"
```
