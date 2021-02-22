pipeline{
    agent any
        tools {
        terraform 'terraform-11'
        }
        stages{
            stage('Get the code from Git'){
                steps{
                    git credentialsId: 'EC2-Jenkins', url: 'https://github.com/vjrmalla/devops-code.git'
                }
            }
            stage('Terraform init'){
                steps{
                    sh '''cd terraform
                    terraform init -force-copy'''
                }
            }
            stage('Terraform apply'){
                steps{
                    sh '''cd terraform
                    terraform apply --auto-approve'''
                }
            }
        }
    
}
