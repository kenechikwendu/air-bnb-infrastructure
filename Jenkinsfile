pipeline {
    agent any

    stages {
        stage('Git Checkout') {
            steps {
                echo 'Clone Project codebase'
                git branch: 'main', url: 'https://github.com/kenechikwendu/air-bnb-infrastructure.git'
                echo 'codebase clonned'
            }
        }
        stage('Verify Terraform version') {
            steps {
                echo 'Verifying the Terraform version'
                sh 'terraform --version'
                echo 'Terraform version verified'
            }
        }
        stage('Terraform Init') {
            steps {
                echo 'Perform Terraform init'
                sh 'terraform init'
                echo 'Terraform init performed'
            }
        }
        stage('Terraform validate') {
            steps {
                echo 'check for correctness of syntax'
                sh 'terraform validate'
                echo 'Terraform validate performed'
            }
        }
        stage('Terraform plan') {
            steps {
                echo 'perform a dry run'
                sh 'terraform plan'
                echo 'Terraform plan performed'
            }
        }
        
        stage('checkov scan') {
            steps {
                sh """
                pip3 install --user checkov
                checkov -d . --skip-check CKV_AWS*
                """
            }
        }
        
        stage('Terraform apply') {
            steps {
                echo 'Build our infrastructure'
                sh 'terraform apply --auto-approve'
                echo 'Terraform apply performed'
            }
        }
        
    }
    
    post {
        success {
            slackSend channel: '#jenkins-integration', color: 'good', message: 'Deployment was successful!'
        }
        failure {
            slackSend channel: '#jenkins-integration', color: 'danger', message: 'Deployment failed, Please check!'
        }
    }
   
   
    
}
