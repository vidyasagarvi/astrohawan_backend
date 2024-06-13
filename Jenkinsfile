pipeline {
    agent any

    environment {
        NODE_VERSION = 'v20.14.0'  // Specify the Node.js version you need
    }

    stages {
        stage('Setup') {
            steps {
                script {
                    // Install nvm
                    sh 'curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash'

                    // Source nvm to make it available in subsequent steps
                    sh 'source ~/.bashrc || source ~/.bash_profile || source ~/.profile'

                    // Install the required Node.js version using nvm
                    sh "nvm install ${NODE_VERSION}"

                    // Use the installed Node.js version
                    sh "nvm use ${NODE_VERSION}"
                }
            }
        }

        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/vidyasagarvi/puja-store-backend.git', credentialsId: 'Github-vidyasagar-PAT'
            }
        }

        stage('Install Dependencies') {
            steps {
                // Ensure nvm environment is loaded and Node.js version is used
                sh 'npm install'
            }
        }

        stage('Build') {
            steps {
                // Ensure nvm environment is loaded and Node.js version is used
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
