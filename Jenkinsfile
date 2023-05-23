pipeline { 

    environment { 

        registry = "agorbach/far-2-cel" 

        registryCredential = 'dockerhub_id' 

        dockerImage = '' 

    }

    agent any 

    stages { 

        stage('Cloning our Git') { 

            steps { 

                git 'https://github.com/alexpitronot/far-2-cel.git' 

            }

        } 
              
        stage('Change Directory') {
            steps {
                dir('Test FAR-2-CEL@tmp') {
                    // Perform actions within the directory
                    // For example, run shell commands or execute build steps
                    sh 'echo "Performing actions within Test FAR-2-CEL directory"'
                    sh 'ls -l'
                    sh 'pwd'
                    // ...
                }
            }       
        }

        stage('Copy') {
            steps {                
                    sh 'git clone https://github.com/alexpitronot/far-2-cel.git'
                    sh 'pwd'                 
                
            }       
        }

        stage('Building our image') { 

            steps { 

                script {                     
                    dockerImage = docker.build registry + ":$BUILD_NUMBER" 

                }

            } 

        }

        stage('Deploy our image') { 

            steps { 

                script { 

                    docker.withRegistry( '', registryCredential ) { 

                        dockerImage.push() 

                    }

                } 

            }

        } 

        stage('Cleaning up') { 

            steps { 

                sh "docker rmi $registry:$BUILD_NUMBER" 

            }

        } 

    }

}
