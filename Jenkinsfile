pipeline{
    agent {
        node{
            label 'kworkerthree'
        }
    }

    tools {
        maven 'slave-mvn'       
    }

    environment {
        DOCKER_USER = credentials('dockerid')
        DOCKER_PASSWORD = credentials('dockerpwd')
        DOCKER_TAG = "sanjeetkr/web-app:v1.2.0"      
    }

    stages {
        
        stage('Build jar file') {
            steps {
                echo "Building jar"
                sh 'mvn clean package'
                echo "executing pipeline"
            }
        }

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
                    def dockerCmd = "docker run -d -p 8080:8080 ${DOCKER_TAG}"
                    sshagent(['ec2-server']) {
                        sh "ssh -o StrictHostKeyChecking=no ec2-user@44.201.154.161 ${dockerCmd}"
                    }
                }
            }
        }


    }
    post{
        always{
            echo "Publishing test result"
            junit "**/target/surefire-reports/*.xml"
        }
    } 
    
}