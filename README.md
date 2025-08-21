# Chest Disease Prediction (Adenocarcinoma vs Normal) 🫁

This project focuses on detecting **Adenocarcinoma** from **CT scan chest images** using deep learning. 
The solution uses **VGG16** as the base CNN model, combined with **Flask** for deployment, and a full **MLOps pipeline** with MLflow, DVC, Jenkins, GitHub Actions, Docker, and AWS.

---

## 📌 Problem Statement
Early detection of **adenocarcinoma (a type of lung cancer)** is critical for treatment.  
This project builds a classification model to distinguish between **healthy chest scans** and those with adenocarcinoma.

---

## Data sample images

### With Adenocarcinoma
![alt text](<Screenshot 2025-08-22 at 00.31.39.png>)
![alt text](<Screenshot 2025-08-22 at 00.32.18.png>)

### Normal 
![alt text](<Screenshot 2025-08-22 at 00.29.57.png>)
![alt text](<Screenshot 2025-08-22 at 00.30.34.png>)

## ⚙️ Project Workflow
1. **Data Ingestion** – CT scan images were collected and organized.
2. **Preprocessing & Model Preparation** – Used **VGG16** (transfer learning).
3. **Training** – 
   - Epochs: **20**  
   - Split: **80% training, 20% testing & validation**
   - Accuracy: **91%**
   - (Limited by CPU; accuracy expected to improve with GPU & more epochs)
4. **Experiment Tracking** – 
   - **MLflow** for metrics  
   - **DagsHub** for remote experiment + data versioning  
5. **Model Deployment** – 
   - Flask-based UI for predictions  
   - Dockerized the application  
   - Pushed image to **AWS ECR**  
   - Deployed on **AWS EC2**  
6. **CI/CD** –  
   - Triggered by **GitHub Actions**  
   - Automated pipelines with **Jenkins**  
   - Two EC2 instances were used:  
     - One for Jenkins (CI/CD automation)  
     - One for hosting the Flask app (production)

---

## 🗂️ Project Structure

```bash
CHESTDISEASEPRED/
│── .dvc/                     # DVC metadata for dataset versioning
│── .github/workflows/        # GitHub Actions workflow
│   └── main.yaml             # CI/CD trigger file
│── .jenkins/                 # Jenkins configuration
│   └── Jenkinsfile           # Jenkins pipeline definition
│── artifacts/                # Stored artifacts (models, logs, etc.)
│── config/                   # Config files for model & pipeline
│── logs/                     # Training & app logs
│── model/                    # Saved models
│── research/                 # Jupyter notebooks / experiments
│── src/                      # Main source code
│   └── cnnClassifier/
│       ├── components/       # Data ingestion, training, evaluation scripts
│       ├── config/           # Config management
│       ├── constants/        # Constant values
│       ├── entity/           # Data entities
│       ├── pipeline/         # ML pipeline (training, prediction)
│       └── utils/            # Utility functions
│── templates/                # Flask HTML templates
│   └── index.html            # UI for predictions
│── app.py                    # Flask app entry point
│── docker-compose.yml        # Docker compose (multi-container support)
│── Dockerfile                # Docker build instructions
│── dvc.yaml                  # DVC pipeline definition
│── params.yaml               # Hyperparameters & config
│── requirements.txt          # Dependencies
│── setup.py                  # Package setup
│── README.md                 # Project documentation (this file)
```

---

## 🚀 Model
- **Base Model**: VGG16 (pretrained on ImageNet)
- **Fine-tuned** on CT scan dataset
- **Accuracy**: 91% after 20 epochs

---

## 🖥️ Flask Application
- Built a **Flask-based web UI** (`app.py`)  

![alt text](<Screenshot 2025-08-20 at 13.55.11.png>)

- Upload a CT scan image → Model predicts **Healthy** or **Adenocarcinoma**

![alt text](<Screenshot 2025-08-20 at 13.57.13.png>)

- Template: `templates/index.html`

Run locally:
```bash
pip install -r requirements.txt
python app.py
```
Access at: **http://127.0.0.1:8080**

---

## 🐳 Docker & Deployment

### Build Image
```bash
docker build -t chestdiseasepred .
```

### Run Container
```bash
docker run -d -p 8080:8080 chestdiseasepred
```

### AWS Deployment Flow
1. Push Docker image to **ECR**  
2. Pull image on **EC2 instance**  
3. Run container with `-p 8080:8080`  
4. Expose port in **Security Group**  

---

## 🔄 CI/CD Pipeline
- **Version Control**: GitHub  
- **CI Trigger**: GitHub Actions  
- **Automation**: Jenkins pipeline  
- **Registry**: AWS ECR  
- **Deployment**: AWS EC2  

**Why 2 EC2 Instances?**
- **Instance 1 (Jenkins)**: Handles CI/CD pipeline (build, test, push to ECR).  
- **Instance 2 (App Hosting)**: Runs the Docker container serving the Flask app.  
This separation ensures **Jenkins failures don’t affect production**.

---

## 📊 Experiment Tracking
- **MLflow** used for experiment tracking  
- **DagsHub** integrated for remote logging & dataset versioning  

---

## 📈 Results
- Accuracy: **91%**  
- Validation accuracy limited by CPU resources  
- Potential improvement with GPU-enabled training  

---

## 🔮 Future Improvements
- Train for **more epochs** with GPU support (AWS SageMaker / Colab Pro).  
- Add **multi-class classification** for other lung diseases.  
- Deploy with **AWS Elastic Beanstalk / ECS** for scalability.  
- Add **monitoring** with Prometheus & Grafana.  

---

## 🤝 Contributors
- [David Godiah]  
- Open to collaboration – feel free to fork & contribute!  

