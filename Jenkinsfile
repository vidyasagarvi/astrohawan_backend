pipeline {
    agent any

    environment {
        NODEJS_HOME = tool name: 'NodeJS 20', type: 'NodeJS'
        PATH = "${NODEJS_HOME}/bin:${env.PATH}"
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/vidyasagarvi/puja-store-backend.git'
            }
        }

        stage('Install Dependencies') {
            steps {
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
                sshagent(['your-ssh-credentials-id']) {
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
