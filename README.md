# Tasks

## 1 Create a simple application

Using the language of your choice, create any kind of application that will run in Kubernetes.

The application created is a simple Flask app that uses Gunicorn and runs on port 8080.

The application should expose basic metrics (e.g. request count, response time).

Observability is done using prometheus client library available for Python. Then a wrapper is created so that each route used can be easily wrapped and added so that it can create metrics. The metrics endpoint is `/metrics` path.

Total requests and latency are being measured.

## 2 Containerize the application

Write a Dockerfile.

A simple Dockerfile has been done which has a multi-staged build to reduce image size and that follows best practices.

Build and push the image to a container registry (e.g. docker hub, ghcr).

The image has been pushed to the AWS ECR as a private repository. This is achieved using amazon-ecr-login.

## 3 Set up a Kubernetes cluster

Use any tool (e.g. Minikube, Kind, Docker for Desktop, EKS).

EKS was used for this scenario. With the use of modules, it is easy to deploy a fully managed Kubernetes cluster that is ready for deployments.

## 4 Deploy the application

Use Kubectl, Helm, or any other deployment tool of your choice.

Ensure the application can scale based on defined metrics (e.g. cpu utilization, request rate).

## 5 Implement observability

Deploy observability tools to monitor the application (e.g. Prometheus, Grafana),

## 6 Automate the deployment

Feel free to complete this locally or remotely (e.g. Github Actions).

Deployment has been done via one CD pipeline. Not much time was spent on this since it is only required to go from no resources, to having a fully deployed application without testing.