pipeline {

	environment {
		registry = "bryanbcruz/nginx-hello-world"
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
