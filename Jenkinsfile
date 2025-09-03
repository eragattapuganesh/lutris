pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "lutris"
        DOCKER_TAG   = "latest"
        CONTAINER_NAME = "lutris-container"
    }

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    sh '''
                        echo "Building Docker image..."
                        docker build -t $DOCKER_IMAGE:$DOCKER_TAG .
                    '''
                }
            }
        }

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
    }
}

