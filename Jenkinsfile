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
    post{
        failure{
            slackSend (color: '#FFFF00', message: "Build Failed: '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
        }
        fixed {
            slackSend (color: '#FFFF00', message: "Build Fixed: '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
       }
       success {
           slackSend (color: '#00FF00', message: "Build SUCCESSFUL: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
       }
    }
}
