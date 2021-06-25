pipeline {
    agent any
	
 stages {
        stage('Docker Build and Tag image') {
            steps {
                sh 'docker build -t gowebapp:latest .' 
                sh 'docker tag gowebapp:latest ferencmolnar/gowebapp:latest'
                //sh 'docker tag samplewebapp ferencmolnar/gowebapp:$BUILD_NUMBER'
                echo "Docker build tag is: $BUILD_ID"
  		withEnv(['DOCKER_CONTAINER_ID=${sh(docker ps | awk 'FNR == 2 {print $11}').trim()}]) {
			 
   		echo "$DOCKER_CONTAINER_ID"
  		}
            }
        }
     
        stage('Publish image to Docker Hub') {
            steps {
		        withDockerRegistry(credentialsId: 'dockerhub', url: '') {
		        //sh 'docker login --username username --password-stdin < ~/my_passwd'
		        sh 'docker push ferencmolnar/gowebapp:latest'
		    }
        }
    }
     
        stage('Run Docker container on Jenkins Agent') {
            steps {
                sh "docker run -d -p 80:80 ferencmolnar/gowebapp"
            }
        }
    }
}
