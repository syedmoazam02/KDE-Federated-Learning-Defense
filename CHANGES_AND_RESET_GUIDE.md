# Repository Audit & Modification Guide

This document records the architectural structure, file organization, and quality audits conducted for this project workspace.

---

## 📁 1. Master Repository Structure

```text
KDE-Project/
├── app.py                                   # Modern Flask web application (Port: 5050)
├── run_web.bat                              # 1-Click Windows launcher for Web App
├── run_gui.bat                              # 1-Click Windows launcher for Desktop GUI
├── requirements.txt                         # Root Python dependencies list
├── .gitignore                               # Excludes >100MB dataset and cache binaries
├── LICENSE                                  # MIT Open Source License
├── README.md                                # Publication-grade project documentation
│
├── docs/                                    # Academic Project Documentation & Deliverables
│   ├── KDE_Defense_Federated_Learning_Report.pdf         # Official PDF Project Report (66 pages)
│   ├── KDE_Defense_Federated_Learning_Report.docx        # Submission-ready Word Report
│   ├── KDE_Defense_Federated_Learning_Presentation.pdf   # Seminar Presentation PDF (18 slides)
│   └── KDE_Defense_Federated_Learning_Presentation.pptx  # Editable PowerPoint Slides
│
├── templates/
│   └── index.html                           # Clean application UI layout
│
├── static/
│   ├── css/
│   │   └── style.css                        # Web application styles and theme
│   ├── js/
│   │   └── app.js                           # Frontend API logic, manual upload & inspector
│   └── images/
│       ├── accuracy_comparison.png          # Output 2: Accuracy comparison graph
│       ├── model_size_comparison.png        # Output 3: Model size comparison graph
│       └── samples/                         # 40 Real MNIST test digit samples (0-9, 4 variants)
│
└── Lomar/                                   # Original Federated Learning Module
    ├── Main.py                              # Desktop Tkinter Client GUI (TF 2.x compatible)
    ├── Server.py                            # Centralized Aggregation & KDE Defense Server
    ├── requirements.txt                     # Submodule dependency specifications
    ├── run.bat                              # Submodule client launcher
    ├── runServer.bat                        # Submodule server launcher
    ├── Dataset/
    │   └── mnist.csv                        # Benchmark MNIST training & testing dataset
    ├── globalModel/
    │   └── model.hdf5                       # Aggregated global neural network checkpoint
    └── model/
        ├── cnn_weights.hdf5                 # Pre-trained genuine CNN weights
        ├── poison_weights.hdf5              # Poisoned model weights (label-flipped)
        └── poison_history.pckl              # Attack training history metrics
```

---

## 🔍 2. Documentation Audit & Corrections Summary

| Document Component | Identified Issue | Corrective Action Applied |
| :--- | :--- | :--- |
| **Report Front Matter** | Multiple group members listed | Converted all certificate, declaration, and acknowledgment tables to **Syed Moazam (160923748131)** as single author. |
| **Declaration & Ack** | Plural pronouns (`we`, `our`, `us`) | Converted all phrasing to singular (`I`, `me`, `my`). |
| **Report Table 11** | Typo `1.5 SIGINIFICANCE OF THE RESEARCH` | Corrected to `1.5 SIGNIFICANCE OF THE RESEARCH`. |
| **Report Table 12** | Typo `CHAPTER 5: IMPLIMENTATION` & `SYSTEMARCHITECTURE` | Corrected to `CHAPTER 5: IMPLEMENTATION` and `SYSTEM ARCHITECTURE`. |
| **Report Table 13** | Misspelling `Lamar` in figure titles | Standardized to `LoMar`. |
| **Report Abstract** | Typo `non-I.I.Di9mm. settings` & empty `Keywords:` | Fixed to `non-I.I.D. settings` and populated comprehensive research keywords. |
| **Presentation Slide 2** | Contents list had numbering gap (skipped `#6`) | Restructured and renumbered smoothly from `1` to `12`. |
| **Presentation Slide 3** | Phrasing `We introduce` | Updated to `This project introduces`. |
| **Presentation Slide 14**| Slide title `USER VIEW CODE` | Upgraded to `USER INTERFACE WORKFLOW`. |
