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

    stage("testing"){
      sh 'sudo docker run --name nginx-teste-2  nginx-hello-world-2:latest curl localhost > output.txt 2>&1'
      def output=readFile('output.txt').trim()
        if(!output.contains("Hello World")){
          print "Deu ruim, nem vai"
        }
      sh 'docker stop nginx-teste-2'
      sh 'docker rm nginx-teste-2'
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
