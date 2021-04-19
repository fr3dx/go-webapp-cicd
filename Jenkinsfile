pipeline {
    agent any
	
 stages {
      stage('checkout') {
           steps {
             
                git branch: 'main', url: 'https://github.com/fr3dx/jenkins-git'
             
          }
        }
        

  stage('Docker Pull, Build and Tag') {
           steps {
                sh 'docker pull nginx:1.19.10-alpine' 
                //sh 'docker build -t samplewebapp:latest .' 
                sh 'docker tag nginx:1.19.10-alpine ferencmolnar/sampleweb:latest'
                //sh 'docker tag samplewebapp nikhilnidhi/samplewebapp:$BUILD_NUMBER'
               
          }
        }
     
  stage('Publish image to Docker Hub') {
            steps {
		withDockerRegistry(credentialsId: 'dockerhub', url: '') {
		//sh 'docker login --username username --password-stdin < ~/my_passwd'
		sh 'docker push username/sampleweb:latest'
		}
         }
    }
     
      stage('Run Docker container on Jenkins Agent') {
            steps 
			{
                sh "docker run -d -p 80:80 ferencmolnar/sampleweb"
 
            }
        }
    }
}