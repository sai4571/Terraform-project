pipeline {
    agent any

    parameters {
        string(name: 'environment', defaultValue: 'terraform', description: 'Workspace/environment file to use for deployment')
        booleanParam(name: 'autoApprove', defaultValue: false, description: 'Automatically run apply after generating plan?')

    }


     environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }

   /*agent  any
        options {
                timestamps ()
                ansiColor('xterm')
            }*/
    stages {
        stage('checkout') {
            steps {
                 script{
                        dir("terraform")
                        {
                            git "https://github.com/sai4571/Terraform-project.git"
                        }
                    }
                }
            }

        stage('Plan') {
            steps {
                sh 'pwd;cd Terraform project JF ; terraform init -input=false'
                sh 'pwd;cd Terraform project JF ; terraform workspace new ${environment}'
                sh 'pwd;cd Terraform project JF ; terraform workspace select ${environment}'
                sh "pwd;cd Terraform project JF ; terraform plan -input=false -out tfplan "
                sh 'pwd;cd Terraform project JF ; terraform show -no-color tfplan > tfplan.txt'
            }
        }
        stage('Approval') {
           when {
               not {
                   equals expected: true, actual: params.autoApprove
               }
           }

           steps {
               script {
                    def plan = readFile 'Terraform project JF/tfplan.txt'
                    input message: "Do you want to apply the plan?",
                    parameters: [text(name: 'Plan', description: 'Please review the plan', defaultValue: plan)]
               }
           }
       }

        stage('Apply') {
            steps {
                sh "pwd;cd Terraform project JF ; terraform apply -input=false tfplan"
            }
        }
    }
}
