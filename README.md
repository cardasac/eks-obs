# Tasks

> As a side note, I tried adding OpenTel but I ran out of time.

[Link to Demo](https://youtu.be/U8lrUQJXG88)

## 1 Create a simple application

Using the language of your choice, create any kind of application that will run in Kubernetes.

The application created is a simple Flask app that uses Gunicorn and runs on port 8080.

The application should expose basic metrics (e.g. request count, response time).

Observability is done using prometheus client library available for Python. Then a wrapper is created so that each route used can be easily wrapped and added so that it can create metrics. The metrics endpoint is `/metrics` path.

Total requests and latency(response time) are being measured.

## 2 Containerize the application

Write a Dockerfile.

A simple Dockerfile has been done which has a multi-staged build to reduce image size and that follows best practices.

Build and push the image to a container registry (e.g. docker hub, ghcr).

The image has been pushed to the AWS ECR as a private repository. This is achieved using `amazon-ecr-login`. The deployment then uses the private ECR image.

## 3 Set up a Kubernetes cluster

Use any tool (e.g. Minikube, Kind, Docker for Desktop, EKS).

EKS was used for this scenario. With the use of modules, it is easy to deploy a fully managed Kubernetes cluster that is ready for deployments.

## 4 Deploy the application

Use Kubectl, Helm, or any other deployment tool of your choice.

Terraform was used in conjunction with helm to deploy the `k8s-monitoring` chart.

Ensure the application can scale based on defined metrics (e.g. cpu utilization, request rate).

The application can scale horizontally using the `HorizontalPodAutoscaler` on CPU usage.

## 5 Implement observability

Deploy observability tools to monitor the application (e.g. Prometheus, Grafana).

`k8-monitoring` has been deployed to the EKS cluster. This comes with the required tools to then push Logs, Metrics, Traces and so on, onto Grafana Cloud. It leverages Grafana Alloy that can be further customized to retrieve as much information as needed.

## 6 Automate the deployment

Feel free to complete this locally or remotely (e.g. Github Actions).

Deployment has been done via one CD pipeline using GitHub actions. Not much time was spent on this since it is only required to go from no resources, to having a fully deployed application without testing.
