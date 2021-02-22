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
            slackSend "Build failed - Job: ${JOB_NAME} - Build No.: ${BUILD_NUMBER} - Build URL: (<${BUILD_URL}|Open>)"

        }
        changed{
            slackSend "Build status changed - Job: ${JOB_NAME} - Build No.: ${BUILD_NUMBER} - Build URL: (<${BUILD_URL}|Open>)"

        }
    }
}
