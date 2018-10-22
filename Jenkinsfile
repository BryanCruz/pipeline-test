pipeline {

	environment {
		registry = "bryanbcruz/nginx-hello-world"
		registryCredential = 'dockerhubb'
	}

    agent any

    stages {
        stage('building image') {
            steps {
				script {
					docker.build registry = ":$BUILD_NUMBER"
				}
            }
        }
    }
}
