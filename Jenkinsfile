pipeline {
    agent any

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
                    docker.build('bryanbcruz/nginx-hello-world-2')
                }
            }
        }

        stage('Docker push') {
			environment {
				registryCredential = 'docker-bryan'
			}

            steps {
                script {
                	docker.image('bryanbcruz/nginx-hello-world-2').push('\$(git tag | tail -1)')
                }
            }
        }
    }
}

