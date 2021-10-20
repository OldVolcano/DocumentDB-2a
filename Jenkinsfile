library 'jenkins-library'

pipeline {
    agent {
        label 'amzlnx2'
    }

    tools {
        terraform 'terraform-1.0.9'
    }

    environment {
        ARTIFACTORY_USER = credentials('artifactory-username')
        ARTIFACTORY_PASSWORD = credentials('artifactory-password')
        AWS_REGION = "us-east-1"
    }

    stages {
         stage('validate') {
            steps {
                dir('terraform') {
                    sh '''
                        terraform init -backend=false
                        terraform validate
                    '''
                }
            }
        }
        /* Uncomment when tests are added
        stage('test') {
            tools {
                go 'golang-1.14'
            }
            steps {
                withAWS(role:"arn:aws:iam::243249644484:role/WY-cross-jenkins-inf") {
                script {
                    withEnv(["GOPROXY=https://${env.ARTIFACTORY_USER}:${env.ARTIFACTORY_PASSWORD}@wyinc.jfrog.io/wyinc/api/go/goproxy"]) {
                        dir('terraform/tests'){
                            sh '''
                               rm -rf .terraform
                               go get -t
                               go test -timeout 45m
                            '''
                        }
                    }
                }
              }
            }
        } */
        stage('version') {
            when {
                branch 'main'
            }
            steps {
                script {
                    version.generate()
                    version.tag()
                }
            }
        }
    }
    post {
        success {
            script {
                if (env.BRANCH_NAME == 'main') {
                    def version = readFile 'version.txt'
                    currentBuild.description = "${version}"
                }
            }
        }
    }
}
