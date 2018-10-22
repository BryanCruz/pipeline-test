node { 

deleteDir()

    stage('Git clone/pull') {
      git branch: "master",
          credentialsId: "github-bryan",
          url: "https://github.com/BryanCruz/pipeline-test"
    }

    stage("build image"){
    	dir(env.WORKSPACE) {
			withEnv(["DOCKER_HOST=unix:///var/run/docker.sock"]){
				def myImage = docker.build("nginx-hello-world-2:latest")
			}
      	}
    }

    stage("start container"){
		environment {
			APP_NAME = 'nginx-2-teste'
			APP_PORT = '8089'
		}
		sh 'docker stop $APP_NAME'
		sh 'docker rm   $APP_NAME'
    	sh 'docker run --name $APP_NAME -p $APP_PORT\:80 -d nginx-hello-world-2:latest'
    }


//    stage("migration"){
//      sh 'docker run --name lqbase liquibase-img:latest liquibase update > output.txt 2>&1'
//      def output=readFile('output.txt').trim()
//        if(!output.contains("Liquibase Update Successful")){
//          print "Deu ruim, rollback"
//        }
//      sh 'docker rm lqbase'
//    }

    
//     // stage("remove image"){
//     //   sh 'docker rmi -f liquibase-img:latest'
//     // }
    
//     // Liquibase Rollback Successful

// step([$class: 'WsCleanup'])
// deleteDir()

}
