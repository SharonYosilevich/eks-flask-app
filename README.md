# eks-flask-app

Deploying a Flask application on AWS EKS using Docker and Terraform.

## Overview

This project demonstrates how to:
1. Containerize a Flask web application using Docker.
2. Push the Docker image to AWS Elastic Container Registry (ECR).
3. Deploy the application to AWS Elastic Kubernetes Service (EKS) using Kubernetes manifests.
4. Provision infrastructure with Terraform.

## Project Structure

```
eks-flask-app/
│
├── flask-app/
│   ├── app.py               # Main Flask application
│   ├── requirements.txt     # Python dependencies
│   └── templates/
│       └── index.html       # HTML template
│
├── manifests/
│   └── k8s-flask.yaml       # Kubernetes deployment & service definitions
│
├── terraform/
│   ├── iam.tf               # IAM roles and policies
│   ├── main.tf              # Main Terraform configuration
│   ├── outputs.tf           # Terraform output variables
│   ├── provider.tf          # Provider configuration
│   └── vpc.tf               # VPC setup
│
├── Dockerfile               # Docker image instructions
├── .gitignore               # Ignored files for Git
└── README.md                # Project documentation
```

## Prerequisites

- AWS account with permissions for EKS, ECR, IAM, and VPC.
- AWS CLI configured locally.
- Terraform installed.
- kubectl installed.
- Docker installed.

## Deployment Steps

1. **Build and push Docker image to ECR**
    ```bash
    docker build -t <your-image-name> .
    docker tag <image-id> <ecr-repo-url>
    docker push <ecr-repo-url>
    ```

2. **Provision infrastructure with Terraform**
    ```bash
    terraform init
    terraform apply
    ```

3. **Deploy to EKS**
    ```bash
    kubectl apply -f manifests/k8s-flask.yaml
    ```

4. **Access the application**
    - Get the LoadBalancer URL:
    ```bash
    kubectl get svc flask-service
    ```
    - Open in browser: `http://<load-balancer-dns>`

## License

This project is licensed under the MIT License.
