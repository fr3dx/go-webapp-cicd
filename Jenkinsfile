pipeline {
    agent any
	
 stages {
        stage('Docker Build and Tag image') {
            steps {
		    sh 'docker build -t ferencmolnar/gowebapp:latest .
		    DOCKER_IMAGE_ID=$(sudo docker images --filter=reference=ferencmolnar/gowebapp:latest --format "{{.ID}}")    
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
	 
	stage('Print docker image ID') {
            steps {
		    echo "$DOCKER_IMAGE_ID"
            }
        }
    }
}
