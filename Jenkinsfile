pipeline {
    agent any

    environment {
      registry = "bryanbcruz/nginx-hello-world-2"
      registryCredential = 'docker-bryan'
      dockerImage = ''
      dockerTag   = '1111'
    }

    stages {
        stage('Clone from git') {
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

                }
                sh 'git checkout \$(git tag | tail -1)'
            }
        }

        stage('Docker build') {
            steps {
                script {
                    dockerImage = docker.build("${registry}:${dockerTag}")
                    sh 'git branch'
                }
            }
        }

        stage('Docker push') {
            steps {
                script {
                  docker.withRegistry('', registryCredential) {
                    dockerImage.push()
                	  // docker.image(registry).push('\$(git tag | tail -1)')
                  }
                }
            }
        }
    }
}
