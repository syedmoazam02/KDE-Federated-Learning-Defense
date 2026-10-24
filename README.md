# Kernel Density Estimation (KDE)–Based Defense Against Model Poisoning in Federated Learning

## Academic Project Details

- **Title:** Kernel Density Estimation (KDE)–Based Defense Against Model Poisoning in Federated Learning
- **Student Name:** Syed Moazam
- **Roll Number:** 160923748131
- **Program:** Bachelor of Engineering in Computer Science and Engineering (AI & ML)
- **Semester:** 6th Semester Mini Project (Course Code: C69)
- **Internal Guide:** Ms. Raheela Tabassum, Assistant Professor
- **Head of Department:** Dr. Abdul Rasool MD, Professor & HoD
- **Department:** Department of Computer Science and Engineering (Artificial Intelligence and Machine Learning)
- **College:** Lords Institute of Engineering and Technology (UGC Autonomous), Hyderabad
- **Affiliation:** Osmania University
- **Academic Year:** 2025–2026

---

## Project Overview

Federated Learning (FL) allows distributed edge clients to collaboratively train a centralized global deep learning model without transmitting their raw local training data to the server. While this preserves privacy, it leaves the central server vulnerable to **Model Poisoning Attacks**. Adversarial participants can submit crafted model weight updates designed to degrade global model accuracy or inject targeted backdoors (such as flipping label `1` to `0` on the MNIST dataset).

Existing Byzantine-robust defenses (such as Krum, Trimmed Mean, and Coordinate-wise Median) rely heavily on Euclidean distance clustering and assume that honest client updates follow an independent and identically distributed (I.I.D.) pattern. Under real-world **non-I.I.D.** conditions, benign client updates naturally disperse, causing classical distance-based defenses to either discard valid client updates or fail against coordinated adversarial updates.

This project implements a non-parametric defense framework based on **Kernel Density Estimation (KDE)** (LoMar). The central aggregation server estimates the local probability density of incoming client parameter updates using a Gaussian kernel. Each update is evaluated against its $k$-nearest neighbors to compute a relative malicious score. Updates that fall below an adaptive density threshold are flagged as adversarial and rejected prior to federated model aggregation (FedAvg).

Furthermore, the project evaluates a model compression extension using lossless zlib encoding to reduce client-server communication overhead during model transmission rounds.

---

## Deliverables in this Repository

All evaluation and presentation deliverables are included in the [`docs/`](docs/) directory:

| Document | Format | Description | Path |
| :--- | :---: | :--- | :--- |
| **Project Report (PDF)** | PDF | Complete 66-page bound project report formatted to university guidelines | [`docs/KDE_Defense_Federated_Learning_Report.pdf`](docs/KDE_Defense_Federated_Learning_Report.pdf) |
| **Project Report (Word)** | DOCX | Editable Word document of the complete project report | [`docs/KDE_Defense_Federated_Learning_Report.docx`](docs/KDE_Defense_Federated_Learning_Report.docx) |
| **Presentation Slides (PDF)** | PDF | 18-slide seminar defense presentation deck | [`docs/KDE_Defense_Federated_Learning_Presentation.pdf`](docs/KDE_Defense_Federated_Learning_Presentation.pdf) |
| **Presentation Slides (PPTX)** | PPTX | Native PowerPoint file for seminar and viva evaluation | [`docs/KDE_Defense_Federated_Learning_Presentation.pptx`](docs/KDE_Defense_Federated_Learning_Presentation.pptx) |

---

## Methodology & Formulation

### 1. Gaussian Kernel Density Estimation
For $N$ client weight update vectors $\{w_1, w_2, \dots, w_N\}$ projected into latent parameter space, the density estimate at point $w$ is given by:

$$\hat{f}(w) = \frac{1}{N \cdot h^d} \sum_{i=1}^{N} K\left(\frac{w - w_i}{h}\right)$$

where $K(u) = (2\pi)^{-d/2} \exp\left(-\frac{1}{2}\|u\|^2\right)$ is the Gaussian kernel, $h = 0.5$ is the bandwidth calculated using Silverman's rule of thumb, and $d$ is the feature dimensionality.

### 2. Relative Malicious Score
To account for non-I.I.D. variance among honest clients, the density of each update $w_i$ is compared to the average density of its $k$-nearest neighbors ($\mathcal{N}_k(w_i)$ with $k=5$):

$$S(w_i) = \frac{\frac{1}{k} \sum_{j \in \mathcal{N}_k(w_i)} \hat{f}(w_j)}{\hat{f}(w_i)}$$

- For **honest updates**: $S(w_i) \approx 1.0$ (consistent with surrounding cluster).
- For **adversarial / poisoned updates**: $S(w_i) \gg 1.5$ (isolated in low-density regions).

### 3. Adaptive Thresholding
The server dynamically determines the rejection threshold $\tau$ based on the 75th percentile of the score distribution across all received updates:

$$\tau = \text{Quantile}_{0.75}(\{S(w_1), \dots, S(w_N)\})$$

Updates with scores exceeding $\tau$ are rejected, and the remaining clean weights are aggregated using Federated Averaging (FedAvg).

---

## Experimental Results

The defense was tested on the MNIST benchmark dataset under a 30% targeted label-flipping poisoning attack (flipping label `1` to `0` across 4,000 samples):

| Parameter / Metric | Baseline (No Defense - FedAvg) | Proposed Defense (LoMar KDE) | Notes / Outcome |
| :--- | :---: | :---: | :--- |
| **Global Model Accuracy** | 87.92% | **99.07%** | **+11.15% accuracy restored** under attack |
| **Malicious Update Detection** | 0% (Undetected) | **93.50%** | Accurately identifies label-flipped submissions |
| **False Positive Rate** | N/A | **4.20%** | Preserves honest non-I.I.D. client updates |
| **Uncompressed Model Size** | 2,641,760 Bytes | 2,641,760 Bytes | Base CNN weights (~2.52 MB) |
| **Compressed Model Size** | 2,641,760 Bytes | **550,000 Bytes** | **79.2% communication payload reduction** |

---

## Running the Project

### Prerequisites
- Python 3.8 to 3.14
- Dependencies listed in `requirements.txt`

### Setup
```bash
git clone https://github.com/syedmoazam02/KDE-Federated-Learning-Defense.git
cd KDE-Federated-Learning-Defense
pip install -r requirements.txt
```

### 1. Web Application (Flask)
To start the web application and interactive inspector:
```bash
python app.py
```
Open a browser and go to:
```
http://127.0.0.1:5050
```
Features of the web dashboard:
- Step-by-step federated training controls (Dataset loading, preprocessing, model upload, and graph views).
- Automated evaluation pipeline to run the full benchmark sequence.
- Option to upload a custom manual MNIST `.csv` file.
- Interactive MNIST digit inspector across 40 real samples (digits 0–9 with 4 variations each) showing how the poisoned model flips `1` to `0` and how KDE defense isolates the attack.

### 2. Desktop GUI (Tkinter + Sockets)
To run the original desktop client and server:

**Terminal 1 (Server):**
```bash
cd Lomar
python Server.py
```

**Terminal 2 (Client GUI):**
```bash
cd Lomar
python Main.py
```

---

## Project Structure

```text
KDE-Project/
├── app.py                                   # Flask web application backend
├── run_web.bat                              # Windows batch launcher for web dashboard
├── run_gui.bat                              # Windows batch launcher for desktop GUI
├── requirements.txt                         # Python dependencies
├── LICENSE                                  # MIT License
├── README.md                                # Project documentation
│
├── docs/                                    # Documentation and seminar deliverables
│   ├── KDE_Defense_Federated_Learning_Report.pdf         # Project report (PDF)
│   ├── KDE_Defense_Federated_Learning_Report.docx        # Project report (DOCX)
│   ├── KDE_Defense_Federated_Learning_Presentation.pdf   # Seminar slides (PDF)
│   └── KDE_Defense_Federated_Learning_Presentation.pptx  # Seminar slides (PPTX)
│
├── templates/
│   └── index.html                           # Web dashboard HTML layout
│
├── static/
│   ├── css/
│   │   └── style.css                        # Web styling and layout
│   ├── js/
│   │   └── app.js                           # Frontend logic and API calls
│   └── images/
│       ├── accuracy_comparison.png          # Accuracy comparison graph
│       ├── model_size_comparison.png        # Model compression graph
│       └── samples/                         # MNIST test digit samples (0-9, 4 variants)
│
└── Lomar/                                   # Federated learning source module
    ├── Main.py                              # Tkinter client application
    ├── Server.py                            # Aggregation server with KDE defense
    ├── requirements.txt                     # Submodule requirements
    ├── run.bat                              # Submodule client launcher
    ├── runServer.bat                        # Submodule server launcher
    ├── Dataset/
    │   └── mnist.csv                        # Benchmark MNIST dataset
    ├── globalModel/
    │   └── model.hdf5                       # Aggregated global CNN model
    └── model/
        ├── cnn_weights.hdf5                 # Pre-trained genuine CNN weights
        ├── poison_weights.hdf5              # Poisoned model weights
        └── poison_history.pckl              # Attack training history
```

---

## Author

**Syed Moazam**  
Roll Number: 160923748131  
Department of Computer Science and Engineering (AIML)  
Lords Institute of Engineering and Technology (UGC Autonomous), Hyderabad  
Affiliated with Osmania University  
GitHub: [syedmoazam02](https://github.com/syedmoazam02)  
Email: syedmoazam101@gmail.com

---

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
