pipeline {
    agent any
    
    stages {
        stage('Clone Repository') {
            steps {
                git 'git@github.com:Rkeram/jenkins-k8s-cicd.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("rkeram1/helloworld-java:${env.BUILD_ID}")
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhublogin') {
                        docker.image("rkeram1/helloworld-java:${env.BUILD_ID}").push()
                    }
                }
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                script {
                    kubernetesDeploy(configs: "deploymentservice.yml", kubeconfigId: "kubernetes")
                }
            }
        }
    }
}

