# End-to-End DevOps Pipeline Project

This repository is a hands-on project to build and demonstrate a complete, production-ready DevOps pipeline for a simple web application. The goal is to implement a modern workflow using free-tier tools, covering everything from source control and CI to security, deployment, and orchestration.

The structure and goals of this project are based on the excellent freeCodeCamp article:
[**How to Build a Production-Ready DevOps Pipeline with Free Tools**](https://www.freecodecamp.org/news/how-to-build-a-production-ready-devops-pipeline-with-free-tools/)

---

## Key Skills & Technologies Learned

This project serves as a practical demonstration of my hands-on skills in modern DevOps practices and cloud-native technologies. For a potential employer, this highlights my ability to:

* **Implement CI/CD Pipelines:**
    * **GitHub Actions:** Wrote entire end-to-end CI pipelines from scratch.
    * **Automation:** Configured workflows to automatically build, test, scan, and deploy applications on every code push.
    * **Optimization:** Implemented multi-stage Docker builds to create lightweight, production-ready images.

* **Manage Containerization & Orchestration:**
    * **Docker:** Wrote a `Dockerfile` and managed the full container lifecycle (build, tag, push).
    * **Kubernetes (K3d):** Deployed and managed a lightweight, local Kubernetes cluster (`k3d`) to simulate a production environment.
    * **K8s Manifests:** Wrote declarative YAML files for `Deployments` and `Services` to run applications on Kubernetes.

* **Implement GitOps & Declarative Deployments:**
    * **FluxCD:** Successfully bootstrapped a cluster with Flux to implement a GitOps workflow.
    * **Declarative State:** Managed the cluster's state by separating configuration (in a GitOps repo) from the application code, ensuring a single source of truth.

* **Integrate "Shift-Left" Security (DevSecOps):**
    * **SAST:** Integrated **CodeQL** to perform static analysis on source code for vulnerabilities.
    * **Container Scanning:** Used **Trivy** to scan Docker images for OS and dependency vulnerabilities *before* they are pushed to a registry.
    * **DAST:** Set up an **OWASP ZAP** workflow to perform dynamic security scanning on a deployed application.
    * **Secret Scanning:** Wrote custom scripts in the pipeline to detect hard-coded secrets (e.g., `API_KEY`) and fail the build, preventing leaks.

* **Version Control & Collaboration:**
    * **Git & GitHub:** Used Git for version control and GitHub for repository hosting, workflow automation, and secret management.
    * **Repo Management:** Maintained separate, specialized repositories for application code and for cluster configuration (GitOps).

---

## Project Status & Implemented Features

This project is a work in progress. Here is the current status of the pipeline components:

* **Source Control & Project Structure:** A clean, logical repository structure is in place, separating application code, infrastructure code, and CI workflows.

* **CI Pipeline with GitHub Actions:** Automated workflows (`.github/workflows`) are set up to run on every push to the `main` branch.

* **Optimized Docker Builds:** The project uses a multi-stage `Dockerfile` to create small, fast, and secure container images, reducing build times and attack surface.

* **Security Testing & Scanning:** The CI pipeline is integrated with a full suite of security tools:
    * **CodeQL:** Static analysis scanning (SAST) for vulnerabilities in the application source code.
    * **Trivy:** Container image scanning to find OS and dependency vulnerabilities before pushing to a registry.
    * **OWASP ZAP:** Dynamic application scanning (DAST) workflow is set up to run against a deployed environment.
    * **Custom Scripts:** The pipeline checks for hard-coded secrets (e.g., `API_KEY`) to prevent leaks.

* **Container Orchestration (K3d):**
    * Managed to set up a lightweight local Kubernetes cluster using K3d, which runs on top of Docker Desktop. This provides a minimal, resource-friendly environment for testing deployments.
    * *Note: Encountered and resolved some platform-specific errors (e.g., Docker Desktop connectivity on Windows) to get the cluster operational.*

* **Deployment Pipeline (GitOps):**
    * Successfully implemented a GitOps workflow using **FluxCD**. A separate GitOps repository (`my-k8s-flux`) holds the Kubernetes manifests.
    * The K3d cluster is bootstrapped with Flux, which automatically syncs with the GitOps repo, deploying any changes to the cluster's state.

---

## Work in Progress (To-Do)

* **Infrastructure as Code (Terraform):**
    * **Status:** `Blocked`. The plan was to provision cloud infrastructure (web service, database) on Render's free tier. The Terraform code is in the `infra/` directory.
    * **Blocker:** This was halted due to persistent billing verification issues with Render's payment processor not accepting valid cards.

* **Comprehensive Monitoring:**
    * **Status:** `Not Started`. The next major step is to implement a monitoring stack.
    * **Plan:** Deploy **Prometheus** to the cluster for metrics collection and connect it to a **Grafana** dashboard (using Grafana Cloud's free tier) for visualization and alerting.

* **Performance Optimization & Scaling:**
    * **Status:** `Not Started`.
    * **Plan:** Improve CI pipeline speed by implementing **dependency caching** (e.g., for `npm modules`) and **parallelizing jobs** (e.g., running linting and tests at the same time).

---

## Technology Stack

| Category | Tool | Purpose |
| :--- | :--- | :--- |
| **CI/CD** | GitHub Actions | Automating builds, tests, scans, and deployments. |
| **Containerization** | Docker | Building and running the application in a portable container. |
| **Orchestration** | K3d | Running a lightweight Kubernetes cluster locally. |
| **GitOps** | FluxCD | Automatically syncing cluster state with the GitOps repo. |
| **Security (SAST)** | CodeQL | Scanning source code for vulnerabilities. |
| **Security (Image)** | Trivy | Scanning Docker images for vulnerabilities. |
| **Security (DAST)** | OWASP ZAP | Scanning the live application for web vulnerabilities. |
| **IaC (Planned)** | Terraform | Defining cloud infrastructure as code. |
| **Monitoring (Planned)** | Prometheus & Grafana | Collecting metrics and visualizing dashboards. |

---

## Done by Redzer Riley Monsod
