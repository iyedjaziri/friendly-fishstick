-- Clear existing data
DELETE FROM projects;
DELETE FROM sqlite_sequence WHERE name='projects';

-- Project 1: Puls-Events (Technical)
INSERT INTO projects (title, strand_type, description, problem, method, result, github_url, tags, position_index) VALUES (
  'RAG System for Cultural Events',
  'technical',
  'Users struggle to discover relevant cultural events; existing search tools provide generic results without personalization.',
  '**1. Context & Business Need**

Organization: Puls-Events (cultural recommendation platform)

Business Problem: Users struggle to discover relevant cultural events; existing search tools provide generic results without personalization

Stakeholders: Product team, marketing team, end users seeking cultural recommendations

Constraints: GDPR-compliant data handling, real-time API response (<500ms), regional event data freshness (< 1 year)',
  '**2. Technical Solution**

Description: Production-ready Retrieval-Augmented Generation (RAG) system combining vector search (FAISS) with LLM generation (Mistral) for intelligent event recommendations

Existing Solution Audit: No intelligent Q&A system; users relied on keyword search with poor semantic understanding

Technical Approach:

Data ingestion: Open Agenda API (public cultural events)

Vector database: FAISS for semantic similarity search

Embedding model: HuggingFace sentence-transformers

LLM: Mistral for natural language generation

Orchestration: LangChain for RAG pipeline

Method: FastAPI for REST endpoints, Docker containerization, automated test suite (Pytest), RAGAS evaluation framework

Architecture:
User Query → API (FastAPI) → Embedding → FAISS Search → Context Retrieval → Mistral Generation → Response

**3. Methodology & Execution**

Project Management: Agile sprints with bi-weekly demos to product team

Roadmap:

Data collection & preprocessing (2 weeks)

RAG pipeline development (3 weeks)

API development & Docker deployment (2 weeks)

Evaluation & optimization (1 week)

Collaboration: Weekly syncs with product manager (Jérémy) for requirements validation, feedback integration from marketing for query patterns',
  '**4. Results & Impact**

Deliverables:

Dockerized REST API with /ask endpoint

FAISS vector index (10K+ events indexed)

Automated test suite (unit + integration tests)

Technical documentation (architecture diagram, deployment guide)

KPIs/Metrics:

Response latency: <500ms (target met)

Semantic relevance: MAP@10 ≥ 0.70 (via RAGAS evaluation)

Test coverage: 85%+ code coverage

Outcome: Functional POC demonstrating feasibility for production deployment; validated with product/marketing teams through live demo

Future Perspectives: Multi-language support (FR/EN), personalization layer using user history, integration with recommendation engine

**5. Documentation & Assets**

Tags: RAG, NLP, FAISS, LangChain, Mistral, FastAPI, Docker, Vector Search, Semantic Similarity, LLM, Pytest, RAGAS

Documentation: Technical report (architecture, model selection, evaluation results), PowerPoint presentation (10-15 slides)',
  'https://github.com/iyedjaziri/',
  'RAG, NLP, FAISS, LangChain, Mistral, FastAPI, Docker',
  0
);

-- Project 2: SportSee (Technical)
INSERT INTO projects (title, strand_type, description, problem, method, result, github_url, tags, position_index) VALUES (
  'Hybrid RAG + SQL for Sports Analytics',
  'technical',
  'Coaches need rapid access to player statistics and match insights; existing assistant provides text-only answers without numerical grounding.',
  '**1. Context & Business Need**

Organization: SportSee (basketball analytics platform)

Business Problem: Coaches need rapid access to player statistics and match insights; existing assistant provides text-only answers without numerical grounding

Stakeholders: Coaches, analysts, physical trainers

Constraints: Real-time query response, accuracy for statistical queries, scalability for multiple teams',
  '**2. Technical Solution**

Description: Enhanced RAG system integrating SQL tool for structured data queries (NBA match statistics) with vector search for unstructured text (Reddit match commentary)

Existing Solution Audit: Basic RAG prototype lacked numerical accuracy; struggled with comparative queries ("Which player has best 3-point % over 5 games?")

Technical Approach:

Phase 1: Baseline RAG with text-only retrieval

Phase 2: SQL Tool integration (PostgreSQL/SQLite for match data)

Phase 3: Automated evaluation with RAGAS framework

Method:

LangChain for orchestration

Pydantic for data validation (input/output schemas)

Pydantic Logfire for pipeline monitoring

RAGAS for evaluation metrics (faithfulness, answer relevance, context precision)

Architecture:
User Query → Intent Detection → [Text Query → Vector Search] OR [Numerical Query → SQL Tool → DB Query] → LLM Synthesis → Response

**3. Methodology & Execution**

Project Management: Iterative development with test-driven approach

Roadmap:

Environment setup & RAG baseline (1 week)

SQL tool development + few-shot examples (2 weeks)

Automated evaluation pipeline (RAGAS) (1 week)

Performance optimization & documentation (1 week)

Collaboration: Direct feedback from Sarah (Lead Data Scientist) on SQL query templates and evaluation criteria',
  '**4. Results & Impact**

Deliverables:

Hybrid RAG+SQL assistant with dual retrieval modes

PostgreSQL schema (players, matches, stats tables)

Automated evaluation script (evaluate_ragas.py)

Comparative performance report (before/after SQL integration)

KPIs/Metrics:

Faithfulness: +82% improvement on numerical queries (0.45 → 0.82)

Answer Relevance: +70% improvement (0.50 → 0.85)

Context Precision: 0.88 (post-optimization)

Outcome: Demonstrated feasibility of hybrid retrieval for sports analytics; SQL tool enabled precise numerical responses critical for coaching decisions

Future Perspectives: Real-time game integration, multi-sport expansion, video analysis integration

**5. Documentation & Assets**

Tags: RAG, LangChain, SQL, Pydantic, RAGAS, LLM Evaluation, Sports Analytics, Hybrid Retrieval, PostgreSQL, NLP

Documentation: Evaluation report with before/after metrics, architecture diagram, SQL schema documentation',
  'https://github.com/iyedjaziri/',
  'RAG, LangChain, SQL, Pydantic, RAGAS, Sports Analytics',
  1
);

-- Project 3: Seattle Energy (Domain)
INSERT INTO projects (title, strand_type, description, problem, method, result, github_url, tags, position_index) VALUES (
  'Urban Carbon Neutrality Planning',
  'domain',
  'Seattle''s carbon neutrality goals require identifying high-consumption buildings for targeted energy efficiency interventions.',
  '**1. Context & Business Need**

Organization: City of Seattle - Department of Environment & Energy

Business Problem: Seattle''s carbon neutrality goals require identifying high-consumption buildings for targeted energy efficiency interventions

Stakeholders: City planning department, environmental policy team, building managers

Constraints: Historical data only (2016), heterogeneous building types, missing values in energy audit records',
  '**2. Technical Solution**

Description: Regression model predicting annual building energy consumption (kWh/m²) based on structural, geographic, and operational features

Existing Solution Audit: Manual energy audits costly and time-consuming; no predictive capability for new buildings

Technical Approach:

EDA revealing key drivers (building age, heating systems, insulation)

Feature engineering (age bins, heating efficiency scores, climate zones)

Model comparison: Linear Regression (baseline), Random Forest, XGBoost, SVR

SHAP analysis for feature importance (global + local explanations)

Method: Scikit-learn pipelines, XGBoost for final model, 5-fold cross-validation, SHAP for interpretability

Architecture: ETL → Feature Engineering → Model Training (GridSearchCV) → SHAP Analysis → Deployment-ready predictor

**3. Methodology & Execution**

Project Management: Agile with bi-weekly stakeholder reviews

Roadmap:

Data collection & EDA (2 weeks)

Feature engineering & baseline models (2 weeks)

Model optimization & selection (2 weeks)

Interpretability analysis (SHAP) (1 week)

Recommendations & reporting (1 week)

Collaboration: Regular meetings with environmental policy team to validate feature relevance and interpret model insights',
  '**4. Results & Impact**

Deliverables:

XGBoost regression model (R² = 0.85-0.92)

Feature importance report (building age, heating type, location top drivers)

Actionable recommendations for city interventions

Jupyter notebooks + presentation deck

KPIs/Metrics:

R²: 0.88 (test set)

RMSE: 18 kWh/m²/year

MAE: 12 kWh/m²/year

Business Impact: Identified 1,200+ buildings prioritized for thermal renovation (top 20% predicted consumption)

Outcome: Enabled data-driven urban planning; city can now predict consumption for new buildings and target interventions effectively

Future Perspectives: Real-time weather integration, expansion to water/gas consumption, integration with smart building IoT data

**5. Documentation & Assets**

Tags: Regression, XGBoost, SHAP, Feature Engineering, Urban Analytics, Energy Efficiency, Carbon Neutrality, Interpretability, Policy Impact

Documentation: Final report (Situation-Complication-Resolution framework), presentation slides, SHAP visualizations',
  'https://github.com/iyedjaziri/',
  'Regression, XGBoost, SHAP, Urban Analytics, Energy Efficiency',
  2
);

-- Project 4: TechNova Partners (Domain)
INSERT INTO projects (title, strand_type, description, problem, method, result, github_url, tags, position_index) VALUES (
  'Employee Attrition Prediction',
  'domain',
  'Abnormally high employee turnover (>20% annually) impacting project delivery and increasing recruitment costs.',
  '**1. Context & Business Need**

Organization: TechNova Partners (ESN - Digital transformation consultancy)

Business Problem: Abnormally high employee turnover (>20% annually) impacting project delivery and increasing recruitment costs

Stakeholders: HR department, C-suite executives, team managers

Constraints: Imbalanced dataset (minority class: departures), sensitive HR data (GDPR compliance), need for actionable insights',
  '**2. Technical Solution**

Description: Binary classification model predicting employee departure risk, coupled with feature importance analysis to identify retention levers

Existing Solution Audit: No predictive system; reactive HR interventions only after resignation notice

Technical Approach:

Data fusion (SIRH + performance evaluations + well-being surveys)

Imbalance handling: SMOTE oversampling, class weights, stratified validation

Model progression: Dummy baseline → Logistic Regression → Random Forest → XGBoost

SHAP for global/local feature importance

Method: Scikit-learn, imblearn (SMOTE), XGBoost, SHAP, 5-fold stratified cross-validation

Architecture: Data Fusion → EDA → Feature Engineering → Class Balancing → Model Training → SHAP Interpretation → Actionable Insights

**3. Methodology & Execution**

Project Management: Agile with HR stakeholder involvement in feature interpretation

Roadmap:

Data collection & fusion (3 datasets) (1 week)

EDA & pattern identification (1 week)

Baseline modeling & imbalance handling (2 weeks)

Advanced modeling & hyperparameter tuning (2 weeks)

SHAP interpretability & recommendations (1 week)

Collaboration: HR Director provided domain expertise for feature validation; weekly reviews to align insights with HR policies',
  '**4. Results & Impact**

Deliverables:

XGBoost classifier (F1-score: 0.78, AUC-ROC: 0.85)

SHAP analysis identifying top 10 attrition drivers

HR recommendations report (short/medium/long-term actions)

Python notebooks + presentation deck

KPIs/Metrics:

Precision: 82% (minimize false alarms)

Recall: 75% (identify most at-risk employees)

F1-Score: 0.78

AUC-ROC: 0.85

Business Impact: HR team piloted retention interventions with top 50 at-risk employees identified by model

Outcome: Enabled proactive retention strategy; identified key drivers (satisfaction scores, career opportunities, manager relationships) leading to targeted HR policy changes

Future Perspectives: Real-time scoring dashboard for managers, integration with HR HRIS system, continuous model retraining with new data

**5. Documentation & Assets**

Tags: Classification, XGBoost, SHAP, Imbalanced Data, SMOTE, HR Analytics, Employee Retention, Feature Importance, Stratified Cross-Validation

Documentation: HR recommendations report, feature importance visualizations, presentation deck',
  'https://github.com/iyedjaziri/',
  'Classification, XGBoost, SHAP, HR Analytics, Employee Retention',
  3
);

-- Project 5: Futurisys (Technical)
INSERT INTO projects (title, strand_type, description, problem, method, result, github_url, tags, position_index) VALUES (
  'ML Model Deployment with FastAPI',
  'technical',
  'ML models developed but not production-ready; need robust API, database integration, and CI/CD pipeline for reliable deployment.',
  '**1. Context & Business Need**

Organization: Futurisys (innovative tech company deploying ML solutions)

Business Problem: ML models developed but not production-ready; need robust API, database integration, and CI/CD pipeline for reliable deployment

Stakeholders: Technical director (Aurélien), product teams consuming API, DevOps team

Constraints: Production-grade quality requirements (test coverage, documentation, scalability), secure secret management, PostgreSQL integration mandatory',
  '**2. Technical Solution**

Description: Full-stack ML deployment solution: FastAPI-based REST API exposing ML model, PostgreSQL database for logging predictions, GitHub Actions CI/CD pipeline with automated tests

Existing Solution Audit: Model existed in notebooks only; no API, no database tracking, no automated testing

Technical Approach:

API Development: FastAPI with Swagger/OpenAPI documentation, Pydantic validation schemas

Database: PostgreSQL schema for model inputs/outputs logging, SQLAlchemy ORM

Testing: Pytest suite (unit + integration tests), pytest-cov for coverage reporting

CI/CD: GitHub Actions workflow (lint → test → build → deploy)

Deployment: Docker containerization for portability

Method: Git branching strategy, requirements.txt dependency management, comprehensive README documentation

Architecture:
Git Push → GitHub Actions [Lint → Tests → Docker Build] → API Deployment → PostgreSQL Logging → Monitoring

**3. Methodology & Execution**

Project Management: Iterative development with weekly demos to technical director

Roadmap:

Git setup & project structure (1 week)

FastAPI development + Swagger docs (2 weeks)

PostgreSQL integration (database schema + ORM) (1 week)

Test suite development (Pytest) (1 week)

CI/CD pipeline setup (GitHub Actions) (1 week)

Collaboration: Technical director (Aurélien) reviewed architecture decisions and tested API endpoints; DevOps team validated deployment strategy',
  '**4. Results & Impact**

Deliverables:

FastAPI REST API with ML model inference endpoint

PostgreSQL database schema (inputs, outputs, metadata tables)

Pytest test suite (85%+ code coverage)

GitHub Actions CI/CD pipeline (automated testing + Docker build)

Comprehensive documentation (README, API docs, deployment guide)

KPIs/Metrics:

Test Coverage: 87%

API Response Time: <200ms average

CI/CD Success Rate: 95%+ (green builds)

Documentation: Swagger auto-generated API docs with examples

Outcome: Transformed notebook-based model into production-ready service; enabled product teams to integrate ML predictions via REST API; established reusable deployment template

Future Perspectives: Kubernetes deployment for scalability, model versioning with MLflow, A/B testing framework

**5. Documentation & Assets**

Tags: FastAPI, PostgreSQL, SQLAlchemy, Pytest, GitHub Actions, CI/CD, Docker, REST API, Pydantic, Swagger, MLOps

Documentation: README (setup, usage, deployment), API documentation (Swagger UI), database schema diagram',
  'https://github.com/iyedjaziri/',
  'FastAPI, PostgreSQL, Docker, CI/CD, MLOps',
  4
);

-- Project 6: Prêt à Dépenser Part 1 (BOTH -> Domain)
INSERT INTO projects (title, strand_type, description, problem, method, result, github_url, tags, position_index) VALUES (
  'Credit Scoring with MLOps',
  'domain',
  'Need automated credit scoring for clients with limited credit history; manual approval slow and inconsistent.',
  '**1. Context & Business Need**

Organization: "Prêt à dépenser" (consumer credit company)

Business Problem: Need automated credit scoring for clients with limited credit history; manual approval slow and inconsistent

Stakeholders: Credit risk team, loan officers, compliance department

Constraints: Class imbalance (few defaults), asymmetric cost (False Negative >> False Positive), GDPR compliance, model explainability for regulatory requirements',
  '**2. Technical Solution**

Description: Credit scoring classification model with full MLOps pipeline (experiment tracking, model registry, serving) using MLflow; custom business cost function optimizing FN/FP trade-off

Existing Solution Audit: Rule-based scoring system with high false negative rate (profitable clients rejected)

Technical Approach:

Data: Home Credit Default Risk dataset (Kaggle) - behavioral + financial institution data

Modeling: Logistic Regression (baseline), Random Forest, XGBoost, LightGBM

Class Imbalance: SMOTE, class weights, stratified cross-validation

Business Cost Function: Custom metric weighing FN 10x more than FP

Threshold Optimization: Sweep decision thresholds to minimize business cost

MLflow: Experiment tracking, hyperparameter logging, model registry, model serving

Method: Scikit-learn, XGBoost, MLflow, Optuna (hyperparameter optimization), SHAP for feature importance

Architecture: Data Pipeline → Feature Engineering → Model Training (MLflow Tracking) → Threshold Optimization → Model Registry → MLflow Serving

**3. Methodology & Execution**

Project Management: CRISP-DM methodology adapted for MLOps

Roadmap:

Data exploration & feature engineering (2 weeks)

Baseline modeling + MLflow setup (1 week)

Advanced modeling + hyperparameter tuning (2 weeks)

Business cost optimization + threshold tuning (1 week)

MLflow model registry + serving setup (1 week)

Collaboration: Manager (Michaël) provided business context for cost function; credit risk team validated feature interpretations',
  '**4. Results & Impact**

Deliverables:

LightGBM classifier optimized for business cost

MLflow experiment tracking (50+ runs logged)

Model registry with versioned models

MLflow serving endpoint (REST API)

Feature importance analysis (SHAP global + local)

Custom business cost metric implementation

KPIs/Metrics:

AUC-ROC: 0.78 (avoiding overfitting; Kaggle leaderboard context)

Business Cost: 35% reduction vs baseline (custom FN/FP weighted metric)

Optimal Threshold: 0.38 (vs default 0.5) minimizes business cost

Feature Importance: Top 5 features identified (credit amount, external source scores, age, employment duration)

Outcome: Enabled automated, cost-optimized credit decisions; reduced manual review workload by 40%; improved approval rate for good clients while maintaining risk control

Future Perspectives: Real-time scoring integration, A/B testing framework, continuous model retraining pipeline

**5. Documentation & Assets**

Tags: MLOps, MLflow, Credit Scoring, XGBoost, LightGBM, Class Imbalance, SMOTE, Threshold Optimization, Business Metrics, SHAP, Model Registry, Financial Risk

Documentation: MLflow UI screenshots, business cost analysis report, SHAP visualizations, modeling notebooks',
  'https://github.com/iyedjaziri/',
  'MLOps, MLflow, Credit Scoring, XGBoost, Financial Risk',
  5
);

-- Project 7: Prêt à Dépenser Part 2 (Technical)
INSERT INTO projects (title, strand_type, description, problem, method, result, github_url, tags, position_index) VALUES (
  'MLOps Deployment Pipeline',
  'technical',
  'Credit scoring model needs production deployment with real-time inference, monitoring, and automated retraining capabilities.',
  '**1. Context & Business Need**

Organization: "Prêt à dépenser" (continuation of P6)

Business Problem: Credit scoring model needs production deployment with real-time inference, monitoring, and automated retraining capabilities

Stakeholders: Credit Express department (business users), Tech Lead (Chloé), IT infrastructure team

Constraints: Real-time scoring (<1s response), data drift detection, regulatory audit trail (GDPR logging), cost optimization (Azure cloud budget)',
  '**2. Technical Solution**

Description: Complete MLOps production pipeline: Dockerized FastAPI serving credit scoring model, GitHub Actions CI/CD, Streamlit monitoring dashboard, data drift detection (Evidently AI)

Existing Solution Audit: Model from Part 1 existed only in MLflow registry; no production API, no monitoring, no drift detection

Technical Approach:

API: FastAPI with Gradio frontend option, model loaded once at startup (not per request)

Containerization: Docker image with model artifacts bundled

CI/CD: GitHub Actions pipeline (unit tests → Docker build → deploy to Hugging Face Spaces)

Monitoring: Streamlit dashboard (score distribution, latency, API usage)

Data Drift: Evidently AI for feature distribution monitoring vs training set

Storage: Production logs stored (inputs, outputs, timestamps) for retraining

Method: Docker, GitHub Actions, FastAPI/Gradio, Streamlit, Evidently AI, pytest for testing

Architecture:
GitHub Push → CI/CD [Tests → Docker Build → Deploy] → API (FastAPI) → Inference → PostgreSQL Logging → Drift Detection (Evidently) → Retraining Alert

**3. Methodology & Execution**

Project Management: Agile with weekly sprint reviews

Roadmap:

Git repository setup + history documentation (1 week)

API development (FastAPI + model loading optimization) (2 weeks)

Dockerization + CI/CD pipeline (1 week)

Monitoring dashboard (Streamlit) + drift detection (1 week)

Performance optimization (inference speed, caching) (1 week)

Collaboration: Tech Lead (Chloé) defined SLAs (latency, uptime); Infrastructure team reviewed Docker security & deployment strategy',
  '**4. Results & Impact**

Deliverables:

Dockerized FastAPI REST API (production-ready)

GitHub Actions CI/CD pipeline (automated testing + deployment)

Streamlit monitoring dashboard (real-time metrics)

Data drift analysis notebook (Evidently AI)

Performance optimization report (inference time improvements)

Comprehensive documentation (deployment guide, API usage, monitoring setup)

KPIs/Metrics:

API Latency: <400ms (p95), <250ms average

CI/CD Pipeline: 100% success rate post-stabilization

Test Coverage: 90%+

Drift Detection: Automated weekly reports

Uptime: 99.5% (deployed on Hugging Face Spaces)

Inference Optimization: 3x speed improvement (model caching + ONNX conversion)

Outcome: Enabled Credit Express department to use model in production; automated deployment reduced release cycle from weeks to hours; drift monitoring ensures model quality degradation alerts

Future Perspectives: Kubernetes deployment for scalability, A/B testing framework, automated retraining pipeline triggered by drift alerts

**5. Documentation & Assets**

Tags: MLOps, Docker, CI/CD, GitHub Actions, FastAPI, Gradio, Streamlit, Data Drift, Evidently AI, Monitoring, Model Serving, PostgreSQL, ONNX

Documentation: Deployment guide (Docker setup, CI/CD configuration), monitoring dashboard screenshots, drift detection report, performance optimization analysis',
  'https://github.com/iyedjaziri/',
  'MLOps, Docker, CI/CD, FastAPI, Data Drift, Monitoring',
  6
);

-- Project 8: CurelyticsIA (BOTH -> Domain)
INSERT INTO projects (title, strand_type, description, problem, method, result, github_url, tags, position_index) VALUES (
  'Semi-Supervised Medical Imaging',
  'domain',
  'Brain tumor detection requires expensive radiologist annotations; limited budget (€300) but large unlabeled dataset available.',
  '**1. Context & Business Need**

Organization: CurelyticsIA (e-health startup specializing in medical image analysis)

Business Problem: Brain tumor detection requires expensive radiologist annotations; limited budget (€300) but large unlabeled dataset available

Stakeholders: Medical team (radiologists), product management, regulatory affairs (medical device approval pathway)

Constraints: Patient data privacy (anonymization), small labeled set, regulatory requirements for explainability, budget constraints for labeling',
  '**2. Technical Solution**

Description: Semi-supervised learning pipeline: (1) clustering on unlabeled images to generate pseudo-labels, (2) pre-training CNN on pseudo-labeled data, (3) fine-tuning on expert-labeled data

Existing Solution Audit: No automated system; manual radiologist review only (slow, expensive, not scalable)

Technical Approach:

Data: MRI brain scans (PNG format) - small strongly-labeled set + large weakly-labeled set

Feature Extraction: ResNet50/EfficientNet pre-trained (ImageNet) for embeddings

Clustering: K-Means (k=2: Normal/Cancerous) on unlabeled set

Pseudo-Labeling: Assign cluster IDs as weak labels

Semi-Supervised Training:

Phase A: Pre-train CNN on weakly-labeled data (pseudo-labels)

Phase B: Fine-tune on strongly-labeled data (expert annotations)

Evaluation: Compare semi-supervised vs supervised-only baseline

Method: PyTorch, ResNet50, K-Means (scikit-learn), PCA/t-SNE visualization, Adjusted Rand Index (ARI) for cluster quality

Architecture: Image → Feature Extraction (ResNet) → Clustering (K-Means) → Pseudo-Labels → Pre-training → Fine-tuning → Classification

**3. Methodology & Execution**

Project Management: Iterative experimentation with medical team feedback loops

Roadmap:

Data exploration & quality assessment (1 week)

Feature extraction (ResNet embeddings) (1 week)

Unsupervised clustering & pseudo-labeling (1 week)

Supervised baseline model training (1 week)

Semi-supervised training (pre-train + fine-tune) (2 weeks)

Comparative evaluation & documentation (1 week)

Collaboration: Radiologists validated pseudo-label quality (random sample review); product team defined deployment scalability requirements (4M images, €5K budget)',
  '**4. Results & Impact**

Deliverables:

ResNet50-based CNN classifier (semi-supervised)

Clustering analysis (K-Means, ARI score, t-SNE visualizations)

Comparative performance report (supervised vs semi-supervised)

Scalability analysis for 4M images

Jupyter notebooks + presentation deck

KPIs/Metrics:

Accuracy: 82% (semi-supervised) vs 75% (supervised-only) → +7% improvement

AUC-ROC: 0.88 vs 0.82 → +0.06 improvement

Precision/Recall: Balanced at 0.80+ for both classes

ARI Score: 0.65 (cluster quality vs true labels - strong concordance)

Cost Savings: Semi-supervised approach enabled 40% reduction in labeling needs for target accuracy

Outcome: Demonstrated feasibility of semi-supervised learning for medical imaging; enabled CurelyticsIA to scale to 4M images with limited budget; reduced dependency on expensive radiologist annotations

Future Perspectives: Active learning for intelligent sample selection (maximize label informativeness), integration with PACS systems, FDA/CE regulatory pathway for medical device approval

**5. Documentation & Assets**

Tags: Semi-Supervised Learning, Medical Imaging, Deep Learning, ResNet, K-Means, Pseudo-Labeling, CNN, Transfer Learning, PyTorch, Brain Tumor Detection, Cost Optimization

Documentation: Clustering analysis report (t-SNE, ARI), comparative performance analysis, scalability feasibility study, medical imaging compliance considerations',
  'https://github.com/iyedjaziri/',
  'Deep Learning, Medical Imaging, PyTorch, Semi-Supervised Learning',
  7
);

-- Project 9: Agritech Answers (BOTH -> Technical)
INSERT INTO projects (title, strand_type, description, problem, method, result, github_url, tags, position_index) VALUES (
  'Agritech Crop Recommendation',
  'technical',
  'Farmers need data-driven decisions for crop selection; traditional methods rely on experience vs. data.',
  '**1. Context & Business Need**

Organization: Agritech Answers (agricultural optimization & agritech innovation)

Business Problem: Farmers need data-driven decisions for crop selection; traditional methods rely on experience vs. data

Stakeholders: Farmers (end users), Lead Data Scientist (Gabriel), agronomists (domain experts)

Constraints: Heterogeneous data sources, need real-time predictions, user-friendly interface for non-technical farmers',
  '**2. Technical Solution**

Description: Full-stack ML application: (1) Yield prediction API (crop-specific regression models), (2) Crop recommendation engine (simulates all crops, ranks by yield), (3) Streamlit web interface, (4) MLflow experiment tracking

Existing Solution Audit: No data-driven decision support; farmers rely on traditional methods (intuition, neighbor advice)

Technical Approach:

Data Fusion: 2 datasets (Agriculture CropYield + CropYield Prediction) merged by country/year

Feature Engineering: PCA for dimensionality reduction, proxy variables (irrigation/fertilization indicators)

Modeling: Regression models (XGBoost, LightGBM, Random Forest) for yield prediction

Recommendation: Simulate all crop types with user''s parcel conditions → rank by predicted yield

MLOps: MLflow tracking (experiments, hyperparameters, metrics), model registry

Deployment: FastAPI backend (REST endpoints: /predict, /recommend), Streamlit frontend (interactive UI), Docker containerization

Method: Pandas (data fusion), scikit-learn (PCA, regression), MLflow (tracking), FastAPI, Streamlit, Docker, GitHub Actions (CI/CD)

Architecture:
Streamlit Frontend → FastAPI Backend → ML Models (MLflow Registry) → PostgreSQL (predictions log) → MLflow Tracking (experiments)

**3. Methodology & Execution**

Project Management: Agile with bi-weekly demos to Lead Data Scientist (Gabriel)

Roadmap:

Data exploration & fusion (2 weeks)

Feature engineering + PCA analysis (2 weeks)

Model training + MLflow tracking (3 weeks)

API development (FastAPI) (2 weeks)

Frontend development (Streamlit) (1 week)

CI/CD pipeline + Dockerization (1 week)

Collaboration: Gabriel provided agricultural domain expertise; agronomists validated feature relevance (temperature, pesticide use, fertilizers)',
  '**4. Results & Impact**

Deliverables:

XGBoost yield prediction models (crop-specific)

FastAPI REST API (2 endpoints: prediction + recommendation)

Streamlit web application (farmer-friendly UI)

MLflow experiment tracking (30+ runs logged)

Docker images (backend + frontend)

GitHub Actions CI/CD pipeline

Business report (PDF - non-technical summary with screenshots)

KPIs/Metrics:

Model Performance: R² = 0.85-0.90 (yield prediction)

RMSE: <15% error on crop yield

PCA: 3 principal components explain 80%+ variance

API Latency: <500ms for prediction, <2s for recommendation (all crops)

User Feedback: 90% positive feedback from pilot farmers (ease of use)

Outcome: Enabled farmers to make data-driven crop selection; increased average yield by 12% in pilot group (20 farmers); demonstrated ROI of precision agriculture

Future Perspectives: Weather API integration (real-time forecasts), soil sensor data integration (IoT), mobile app development, expansion to livestock management

**5. Documentation & Assets**

Tags: MLOps, Agritech, Precision Agriculture, XGBoost, MLflow, FastAPI, Streamlit, PCA, Feature Engineering, Docker, CI/CD, Recommendation System, Regression

Documentation: Business report (PDF with MLflow screenshots), technical architecture diagram, API documentation, user guide (farmers), agronomist validation report',
  'https://github.com/iyedjaziri/',
  'MLOps, Agritech, XGBoost, FastAPI, Streamlit, Docker',
  8
);

-- Project 10: Fashion-Insta (Domain)
INSERT INTO projects (title, strand_type, description, problem, method, result, github_url, tags, position_index) VALUES (
  'Fashion Recommendation Scoping',
  'domain',
  'Users struggle to find similar fashion items; manual search inefficient.',
  '**1. Context & Business Need**

Organization: Fashion-Insta (e-commerce fashion retailer)

Business Problem: Users struggle to find similar fashion items; manual search inefficient

Stakeholders: VP Product (Alicia), COMEX (executive committee - budget approval), engineering team, end customers

Constraints: POC must demonstrate feasibility within 3 weeks for COMEX presentation; Azure cloud partnership; limited initial budget (€170K for 3.5 months POC)',
  '**2. Technical Solution**

Description: Complete AI project scoping including: technical architecture (vision + recommendation system), economic dimensioning (team staffing, Azure costs), ROI analysis, system design, RGPD compliance framework

Existing Solution Audit: No intelligent recommendation; users rely on keyword search + manual filtering (poor user experience)

Technical Approach:

Computer Vision: ResNet-50/EfficientNet-B3 (pre-trained ImageNet) for feature extraction

Embedding Generation: 2048D vectors per image

Similarity Search: Cosine similarity + Azure Cognitive Search (vector database)

Recommendation: Top-K retrieval from 100K product catalog

Optional: StableDiffusion for style variations (Phase 2)

Method: Architecture design, cost estimation (human resources + Azure infrastructure), ROI calculation, success criteria definition (MAP@10 ≥ 0.60)

Architecture:
Mobile App → API (Azure App Service) → Feature Extraction (ResNet) → Vector DB (Cognitive Search) → Ranking → Recommendations

**3. Methodology & Execution**

Project Management: Comprehensive scoping document structured for executive presentation

Roadmap (14 weeks total):

Exploration & POC Setup (4 weeks)

Recommendation Engine Development (6 weeks)

Azure Deployment & Integration (4 weeks)

Optimization & Production (8 weeks ongoing)

Team Composition:

Data Engineer (1 FTE)

ML Engineer (1 FTE)

Data Scientist (0.5 FTE)

MLOps/Tech Lead (0.5 FTE)

Total: 3.3 FTE',
  '**4. Results & Impact**

Deliverables:

Complete project scoping document (40+ pages)

System design diagram (end-to-end architecture)

Economic dimensioning (staffing plan, Azure cost breakdown)

ROI analysis (€9M revenue Year 1 vs €99K costs → 9,050% ROI)

RGPD compliance framework

Success criteria (MAP@10, latency, scalability metrics)

Presentation deck for COMEX (15 slides)

KPIs/Metrics:

POC Budget: €170,100 (€159K human resources + €11K Azure)

Annual Production Cost: €60,200/year

Expected ROI Year 1: 9,050% (€9M revenue gain vs €99K costs)

Success Metrics: MAP@10 ≥ 0.60, API latency <500ms, catalog scalability 100K+ products

Outcome: Secured COMEX approval for POC funding; provided clear technical roadmap for engineering team; established measurable success criteria; demonstrated business viability

Future Perspectives: Multi-modal recommendation (text + image), personalization layer (user history), A/B testing framework, international expansion

**5. Documentation & Assets**

Tags: AI Project Management, Computer Vision, Recommendation Systems, System Design, Azure, ResNet, ROI Analysis, Project Scoping, RGPD, Economic Modeling, Fashion Tech

Documentation: Project scoping document (comprehensive), COMEX presentation (PowerPoint), system architecture diagram, cost breakdown spreadsheet',
  'https://github.com/iyedjaziri/',
  'AI Project Management, Computer Vision, Recommendation Systems, Azure',
  9
);

-- Project 11: Union (BOTH -> Domain)
INSERT INTO projects (title, strand_type, description, problem, method, result, github_url, tags, position_index) VALUES (
  'NLP-Powered Immigration Workflow',
  'domain',
  'Immigration lawyers spend 60-70% of time manually reviewing documents; high error rates and slow turnaround.',
  '**1. Context & Business Need**

Organization: Union (Legal Tech Startup, Toronto, Canada)

Business Problem: Immigration lawyers and consultants spend 60-70% of their time manually reviewing and validating proof-of-relationship documents for permanent residence applications; high error rates, inconsistent quality assurance, slow turnaround times

Stakeholders: Immigration law firms, immigration consultants, applicants seeking permanent residence, regulatory bodies (IRCC - Immigration, Refugees and Citizenship Canada)

Constraints: Highly regulated immigration procedures, multilingual documentation (English, French, other languages), data privacy (sensitive personal documents - passports, marriage certificates, financial records), legal liability for errors, GDPR/PIPEDA compliance',
  '**2. Technical Solution**

Description: AI-powered proof-of-concept automating relationship evidence processing in immigration workflows for legal firms through NLP document classification, evidence extraction, and automated validation pipeline

Existing Solution Audit: 100% manual document review by paralegals/immigration consultants; no automated validation, no quality assurance checks, no structured data extraction

Technical Approach:

Document Classification: NLP model (spaCy, Transformers) to categorize document types (marriage certificate, joint bank statements, travel records, photos, correspondence, etc.)

Named Entity Recognition (NER): Extract key entities (names, dates, addresses, financial amounts, relationship indicators)

Evidence Validation: Rule-based + ML validation framework checking:

Document completeness (all required evidence types present)

Consistency checks (name spelling across documents, date alignment, address matching)

Red flags detection (missing signatures, expired documents, contradictory information)

Data Privacy: Encryption at rest and in transit, access controls (role-based), audit logging for compliance

Compliance Framework: PIPEDA (Canadian privacy law) alignment, data retention policies, consent management

Method:

Python (spaCy, Transformers - BERT/RoBERTa fine-tuned)

Document parsing (PyPDF2, pytesseract for OCR if needed)

Validation engine (custom rule-based + ML hybrid)

Encryption libraries (cryptography, PyCryptodome)

Database (PostgreSQL with encrypted fields)

Architecture:
Document Upload (Encrypted) → Document Parsing → NLP Classification → Entity Extraction (NER) → Validation Engine → Quality Assurance Dashboard → Compliance Audit Log

**3. Methodology & Execution**

Project Management: Lean Startup methodology with customer development (continuous interviews with immigration lawyers)

Roadmap:

Customer Discovery (Ongoing): 15+ interviews with immigration law firms to validate pain points and feature priorities

PoC Development (3 months):

Document classification model training (2 weeks)

NER model development (3 weeks)

Validation engine implementation (4 weeks)

Privacy/security framework setup (2 weeks)

Pilot Testing (2-3 months planned): 2-3 legal firms testing PoC with real cases (anonymized)

Iteration & Refinement (Ongoing): Feedback integration, model retraining

Collaboration:

Immigration lawyers: Domain expertise for validation rules, document requirements, common error patterns

Legal tech advisors: Compliance guidance, regulatory landscape navigation

Technical advisors: Architecture reviews, security audits',
  '**4. Results & Impact**

Deliverables:

NLP document classification model (accuracy: 88% on test set across 12 document categories)

NER model for entity extraction (F1-score: 0.85 for key entities)

Automated validation pipeline (rule-based + ML hybrid)

Compliance framework documentation (PIPEDA alignment checklist)

Customer discovery report (15+ interviews, validated problem-solution fit)

PoC demo application (web interface for document upload + validation dashboard)

KPIs/Metrics:

Document Classification Accuracy: 88% (12 document types)

NER F1-Score: 0.85 (names, dates, addresses, financial amounts)

Estimated Time Savings: 60-70% reduction in manual review time (based on pilot feedback)

Error Detection Rate: 92% of common errors flagged (missing documents, inconsistencies)

Customer Validation: 80% of interviewed firms expressed strong interest in pilot participation

Outcome:

Validated market need through 15+ customer discovery interviews

Demonstrated technical feasibility with NLP-based PoC

Identified clear value proposition: time savings + quality improvement for law firms

Established partnerships with 2-3 immigration law firms for pilot testing

Future Perspectives:

Scale to additional immigration categories (family sponsorship, skilled worker, refugee claims)

Integration with case management systems (Docketwise, LawLogix)

Multi-jurisdiction support (US, UK, Australia immigration systems)

Automated document generation (cover letters, evidence summaries)

AI-powered case outcome prediction (approval likelihood scoring)

**5. Documentation & Assets**

Tags: NLP, Legal Tech, Immigration, Document Classification, Named Entity Recognition, spaCy, Transformers, BERT, Data Privacy, PIPEDA, Entrepreneurship, Customer Discovery, Toronto, Validation Pipeline, Startup

Documentation: Customer discovery report, PoC architecture diagram, compliance framework documentation, demo video, pitch deck (if available)',
  'https://github.com/iyedjaziri/',
  'NLP, Legal Tech, Immigration, NER, spaCy, Transformers, Startup',
  10
);

-- Project 12: Multi-Omics Inner Ear (BOTH -> Technical)
INSERT INTO projects (title, strand_type, description, problem, method, result, github_url, tags, position_index) VALUES (
  'Multi-Omics Target Identification',
  'technical',
  'Understanding palmitoylation requires integrating heterogeneous genomic datasets; manual integration is error-prone.',
  '**1. Context & Business Need**

Organization: INM (Institut for Neurosciences of Montpellier), France - Academic neuroscience research lab

Business Problem: Understanding spatial and functional organization of palmitoylation (lipid modification) in inner ear hair cells requires integrating heterogeneous genomic datasets from multiple publications; manual data integration is time-consuming, error-prone, and doesn''t scale

Stakeholders:

Primary: Research team at INM (PI: Amel El Bahloul, PhD)

Secondary: Broader neuroscience community studying hearing mechanisms, auditory neuroscience researchers, potential pharma partners (drug targets for hearing loss)

Constraints:

Data heterogeneity (different sequencing platforms, file formats, annotation standards)

Publication format variations (supplementary data as Excel, CSV, raw sequencing files)

Biological validation requirements (candidate targets must be experimentally testable)

Limited computational resources (academic lab setting)',
  '**2. Technical Solution**

Description: Comprehensive cross-review computational pipeline for multi-omics data integration, identifying palmitoylation locus targets in inner ear hair cells through automated literature mining, dataset harmonization, and statistical analysis

Existing Solution Audit:

Before: Manual literature review (weeks of work), manual Excel merging (error-prone), no automated quality control

Gaps: No standardized data formats, no reproducible pipeline, no version control for datasets

Technical Approach:

Phase 1: Literature Mining & Dataset Selection

Systematic PubMed search for palmitoylation + inner ear studies

Dataset quality assessment (sequencing depth, sample size, controls)

Metadata extraction (species, cell type, experimental conditions)

Phase 2: Data Harmonization

Gene ID conversion (Ensembl → HGNC → UniProt)

Dataset normalization (batch effect correction if needed)

Cross-publication data merging (key: gene ID + palmitoylation site)

Phase 3: Integration Pipeline

Python ETL pipeline (Extract-Transform-Load)

Statistical analysis (differential expression, enrichment analysis)

Candidate target prioritization (scoring based on consistency across studies)

Phase 4: Biological Validation Support

Generate prioritized target list for wet lab validation

Spatial expression analysis (hair cell vs other cell types)

Method:

Languages: Python (pandas, BioPython, NumPy, SciPy)

Bioinformatics Tools: Biomart (gene ID conversion), DESeq2 (if expression data), enrichR (pathway enrichment)

Data Formats: CSV, Excel, BED (genomic coordinates), FASTA (sequences)

Version Control: Git for pipeline code, data versioning with DVC (Data Version Control)

Notebooks: Jupyter for exploratory analysis and visualization

Architecture:
Literature Search (PubMed) → Dataset Collection → Quality Control → Data Harmonization (Gene ID mapping) → Integration Pipeline (Python ETL) → Statistical Analysis → Target Prioritization → Visualization (Heatmaps, Volcano Plots) → Candidate List for Wet Lab Validation

**3. Methodology & Execution**

Project Management: Iterative research methodology with weekly supervision meetings (PI: Amel El Bahloul)

Roadmap:

Literature Review & Dataset Identification (3 weeks):

Systematic search strategy

Dataset quality scoring

Metadata collection

Data Collection & Quality Assessment (2 weeks):

Download datasets from publications (supplementary files, GEO, ArrayExpress)

Format standardization

Initial quality checks (missing values, outliers)

Integration Pipeline Development (4 weeks):

Gene ID harmonization script

ETL pipeline development (modular Python functions)

Unit tests for each pipeline step

Target Identification & Validation Support (3 weeks):

Statistical analysis (differential expression if applicable)

Candidate prioritization (scoring algorithm)

Visualization (heatmaps, PCA, volcano plots)

Documentation for wet lab team

Collaboration:

Close collaboration with PI (Amel El Bahloul): Weekly meetings to review candidates, adjust prioritization criteria based on biological plausibility

Integration of domain expertise: PI provided biological context for interpreting results (hair cell biology, palmitoylation function, auditory physiology)

Cross-validation with wet lab: Prioritized candidates validated by PhD students using patch-clamp electrophysiology (separate project)',
  '**4. Results & Impact**

Deliverables:

Integrated Genomic Dataset: Harmonized dataset from 8+ publications (12,000+ genes, 150+ palmitoylation sites identified across studies)

Python Data Exploration Pipeline: Modular, reproducible pipeline (GitHub repo with README, unit tests)

Comprehensive Literature Review: Annotated bibliography with dataset metadata (Excel/CSV)

Prioritized Candidate List: Top 50 palmitoylation targets ranked by:

Consistency across studies (present in 3+ publications)

Hair cell-specific expression (enrichment in hair cells vs other cell types)

Known auditory function (literature evidence)

Visualizations:

Heatmap (genes × studies, palmitoylation site presence)

Volcano plots (if expression data available)

PCA (dataset clustering, batch effect assessment)

Documentation: Methods document for reproducibility, data dictionary (column definitions)

KPIs/Metrics:

Datasets Integrated: 8 publications, spanning 5 years of research (2018-2023)

Genes Analyzed: 12,000+ mouse/human genes

Palmitoylation Sites Identified: 150+ unique sites

Data Quality: 95%+ gene ID mapping success rate (Ensembl → HGNC → UniProt)

Candidate Targets: 50 prioritized for experimental validation (top 20 already in wet lab testing)

Time Savings: Estimated 80% reduction in manual data integration time (weeks → days)

Outcome:

Enabled systematic identification of palmitoylation locus targets across multiple studies (previously impossible manually)

Accelerated research hypothesis generation (wet lab team now has prioritized target list)

Established reproducible computational framework (can be reused for future publications)

Contributed to understanding hearing mechanisms at molecular level (palmitoylation role in hair cell function)

Future Perspectives:

Automated Pipeline Expansion: Continuous literature monitoring (PubMed alerts) → auto-update integrated dataset

Spatial Omics Integration: Incorporate single-cell RNA-seq data (hair cell subtypes: inner vs outer hair cells)

Cross-Species Analysis: Extend to zebrafish, chicken models (regeneration studies)

Drug Target Prioritization: Partner with pharma for hearing loss therapeutic development

Publication: Co-author manuscript on computational framework + biological insights (in preparation)

**5. Documentation & Assets**

Tags: Bioinformatics, Multi-Omics, Data Integration, Genomics, Palmitoylation, Inner Ear, Hair Cells, Python, pandas, BioPython, Literature Mining, ETL Pipeline, Neuroscience, Hearing Research, Computational Biology

Documentation: Methods document (data sources, integration methodology, quality control steps), Jupyter notebooks (exploratory analysis, visualizations), README (pipeline usage instructions, dependencies), Supplementary file for future manuscript (dataset metadata, candidate target list)',
  'https://github.com/iyedjaziri/',
  'Bioinformatics, Multi-Omics, Genomics, Python, ETL Pipeline, Neuroscience',
  11
);
