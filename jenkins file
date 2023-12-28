pipeline {
    agent any

    environment {
        DOCKER_IMAGE_NAME = 'saifclouddevops/msdjango1'
        DOCKER_IMAGE_TAG = 'latest'
        DOCKER_COMPOSE_FILE = 'docker-compose.yml'
    }

    stages {
        stage('Checkout') {
            steps {
                // Clone the Git repository
                git 'https://github.com/saifclouddevops/django_new.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image
                    docker.build("${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}", "-f Dockerfile .")
                }
            }
        }

        stage('Deploy with Docker Compose') {
            steps {
                script {
                    // Deploy with Docker Compose
                    sh "docker-compose -f ${DOCKER_COMPOSE_FILE} up -d"
                }
            }
        }
    }
}
