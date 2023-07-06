pipeline{
    agent {
        node{
            label 'kworkerthree'
        }
    }

    environment {
        DOCKER_USER = credentials('dockerid')
        DOCKER_PASSWORD = credentials('dockerpwd')
        DOCKER_TAG = "sanjeetkr/nodeapp:v1.1"
    }

    stages {

        stage('Build docker image') {
            steps {
                echo "Building docker image"
                sh "docker build -t ${DOCKER_TAG} ."
                sh "docker login -u $DOCKER_USER -p $DOCKER_PASSWORD"
                sh "docker push ${DOCKER_TAG}"
            }
        }

        stage('Deploy the image') {
            steps {
                script {
                    def docker_cmd = "docker run -d -p 3000:80 sanjeetkr/nodeapp:v1.1"
                    sshagent(['ec2-server']) { // -o StrictHostKeyChecking=no : used to suppress popup
                        sh "ssh -o StrictHostKeyChecking=no ec2-user@44.201.154.161 ${docker_cmd}"

                    }
                }
            }
        }


    }
    
}