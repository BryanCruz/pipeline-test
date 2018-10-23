pipeline {
    agent any

    environment {
      registry = "bryanbcruz/nginx-hello-world-2"
      registryCredential = 'docker-bryan'
      dockerImage = ''
      dockerTag   = 'v1.0.0'
    }

    stages {
        stage('Clone from git and checkout to last tag') {
            steps {
                git(
                    branch: 'master',
                    url: 'https://github.com/BryanCruz/pipeline-test',
                    credentialsId: 'github-bryan'
                )

                script {
                  dockerTag = sh (
                    script: 'git tag | tail -1',
                    returnStdout: true
                  ).trim()

                  sh 'git checkout ' + dockerTag
                }
            }
        }

        stage('Docker build') {
            steps {
                script {
                    dockerImage = docker.build("${registry}:${dockerTag}")
                }
            }
        }

        stage('Docker push') {
            steps {
                script {
                  docker.withRegistry('', registryCredential) {
                    dockerImage.push()
                  }
                }
            }
        }
    }
}
