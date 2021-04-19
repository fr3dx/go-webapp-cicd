pipeline {
    agent any
	
 stages {
        

        stage('Docker tag image') {
            steps {
                //sh 'docker pull golang:alpine' 
                //sh 'docker build -t gowebapp:latest .' 
                sh 'docker tag gowebapp:latest ferencmolnar/gowebapp:latest'
                //sh 'docker tag samplewebapp nikhilnidhi/samplewebapp:$BUILD_NUMBER'
               
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
            steps 
			{
                sh "docker run -d -p 80:80 ferencmolnar/gowebapp"
            }
        }
    }
}