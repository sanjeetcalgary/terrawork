pipeline{
    agent {
        node{
            label 'kworkerthree'
        }
    }

    environment {
        DOCKER_USER = credentials('dockerid')
        DOCKER_PASSWORD = credentials('dockerpwd')
        DOCKER_TAG = "sanjeetkr/nodeapp:v1.0"
    }

    stages {

        stage('Build docker image') {
            steps {
                echo "Building docker image"
                sh "docker build -t ${DOCKER_TAG} ."
                sh "docker login -u $DOCKER_USER -p $DOCKER_PASSWORD"
            }
        }

        stage('Deploy the image') {
            steps {
                echo "Deployment phase"
            }
        }


    }
    
}