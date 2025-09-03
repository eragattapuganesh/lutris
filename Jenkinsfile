
pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "lutris"
        DOCKER_TAG   = "latest"
        CONTAINER_NAME = "lutris-container"
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/lutris/lutris.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh '''
                        echo "Building Docker image..."
                        docker build -t $DOCKER_IMAGE:$DOCKER_TAG .
                    '''
                } // closes script
            } // closes steps
        } // closes stage

        stage('Run Container') {
            steps {
                script {
                    sh '''
                        echo "Running Docker container..."
                        docker run -d --name $CONTAINER_NAME $DOCKER_IMAGE:$DOCKER_TAG
                    '''
                }
            }
        }
    } // closes stages
} // closes pipeline
