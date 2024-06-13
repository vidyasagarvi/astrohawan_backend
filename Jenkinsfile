pipeline {
    agent any

    environment {
        nodeJSVersion = 'NodeJS' // Name of the NodeJS installation in Jenkins
    }

    stages {
        stage('Checkout') {
            steps {
                git credentialsId: 'Github-vidyasagar', url: 'https://github.com/vidyasagarvi/puja-store-backend.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                script {
                    def nodejs = tool name: nodeJSVersion, type: 'jenkins.plugins.nodejs.tools.NodeJSInstallation'
                    env.PATH = "${nodejs}/bin:${env.PATH}"
                }
                sh 'npm install'
            }
        }

        stage('Build') {
            steps {
                sh 'npm run build'
            }
        }

        stage('Deploy') {
            steps {
                sshagent(['SHA256:P5s6zBq20NNYo1jTsmsWL2mx5wv5rFMltlWl7dFJjes']) {
                    sh '''
                    ssh -o StrictHostKeyChecking=no ec2-user@13.127.195.163 << EOF
                    cd /home/ec2-user/app
                    git pull origin main
                    npm install
                    pm2 restart all
                    EOF
                    '''
                }
            }
        }
    }
}
