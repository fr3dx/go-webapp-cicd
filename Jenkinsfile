pipeline {
    agent any
	
 stages {
        stage('Docker Build and Tag image') {
            steps {
                sh 'docker build -t ferencmolnar/gowebapp:latest .' 
                //sh 'docker tag gowebapp:latest ferencmolnar/gowebapp:latest'
                //sh 'docker tag samplewebapp ferencmolnar/gowebapp:$BUILD_NUMBER'
                echo "Docker build tag is: $BUILD_ID"
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
		timeout(time: 3, unit: 'SECONDS') {
                sh "docker run -d -p 80:80 ferencmolnar/gowebapp"
            }
        }
	}
	 stage('Remove docker container delay 25s') {
            steps {
	    	//sh './docker_container_rm.sh'
		script {
   			GIT_COMMIT_EMAIL = sh (
        			script: 'docker ps |awk 'NR==2 {print $11}'',
        			returnStdout: true
    				).trim()
    				echo "Git committer email: ${GIT_COMMIT_EMAIL}"
		}
            }
        }
    }
}
