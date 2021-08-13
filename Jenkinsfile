pipeline { 
    parameters{
        string(name: 'environment', defaultValue: 'terraform', description: 'Workspace/environment file to use for deployment')
    }
    
    environment {
        PROJECT_ID = 'terraform-gcp-320716'
        CREDENTIALS_ID = 'gcp_creds'
    }
    withCredentials([file(credentialsId: 'key-sa', variable: 'gcp_creds')]) {
    sh("gcloud auth activate-service-account --key-file=${gcp_creds}")
    }
    agent {label 'slave-01'}

    stages {
        stage('checkout') { 
            steps { 
                dir("terraform")
                {
                    git "https://github.com/dhruvinmaniar123/terraform_gcp"
                }
            }
        }
        stage('init and plan'){
            steps{
                sh 'curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add - ; sudo apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main" ; sudo apt update ; sudo apt install terraform'
                sh 'pwd;cd terraform ; terraform init'
                sh 'pwd;cd terraform ; terraform workspace new ${environment}'
                sh 'pwd;cd terraform ; terraform workspace select ${environment}'
                sh "pwd;cd terraform ; terraform plan -input=false -out tfplan ; terraform show -no-color tfplan > tfplan.txt"
                
            }
        }
        stage('Apply'){
            input{
                message "Are you sure you want to apply this plan?"
            }
            steps{
                sh "pwd;cd terraform ; terraform apply -input=false tfplan"
            }
        }
    }

}
