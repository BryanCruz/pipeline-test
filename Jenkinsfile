pipeline {
    agent any

    environment {
      registry = "bryanbcruz/nginx-hello-world-2"
      registryCredential = 'docker-bryan'
      dockerImage = ''
    }

    stages {
        stage('Clone from git') {
            steps {
                git(
                    branch: 'master',
                    url: 'https://github.com/BryanCruz/pipeline-test',
                    credentialsId: 'github-bryan'
                )

                sh 'git checkout \$(git tag | tail -1)'
            }
        }

        stage('Docker build') {
            steps {
                script {
                    dockerImage = docker.build(registry)
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
