@Library('Jenkins-Shared_library')
def gv
pipeline {
    agent any
    environment{
        AWS_ACCESS_KEY_ID = credentials('jenkins-aws-access-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('jenkins-aws-secret-access-key-id')
        KUBE_NAMESPACE = 'production'		
        INGRESS_NAMESPACE = 'ingress-nginx'	
    }
    tools{
        gradle '8.10'
    }
    stages {
        stage('Cleanup Workspace') {
            steps {
                cleanWs()
            }
        }
        stage('Checkout') {
            steps {
                checkout scm
            }
        }       
         stage('Lint') {
            steps {
                script {
                    // Run the gradle check task, which includes linting
                    sh './gradlew checkstyleMain checkstyleTest --warning-mode all'
                }
            }
            post {
                always {
                    // Archive the linting report if any
                    archiveArtifacts artifacts: '**/build/reports/**', allowEmptyArchive: true
                }
            }
        }
    }
}