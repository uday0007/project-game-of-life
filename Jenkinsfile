node {
   def mvnHome
   stage('Preparation') { // for display purposes
      // Get some code from a GitHub repository
      git 'https://github.com/uday0007/project-game-of-life.git'
      // Get the Maven tool.
      // ** NOTE: This 'M3' Maven tool must be configured
      // **       in the global configuration.           
      mvnHome = tool 'MAVEN'
	  jdk 'JAVA'
      environment {

      sonar_url = 'http://localhost:9000'
      sonar_username = 'admin'
      sonar_password = 'admin'
}
	   
   stage ('Compile and Build')
   {
      steps 
	  {
         sh '''
         mvn clean install -U  -Dmaven.test.skip=true 
         '''
     }
   }
   stage ('Docker build') {
   steps {
   sh '''
      cd ${WORKSPACE}/jenkins-pipeline-dockerfile
      docker build -t mudaykumar/game-of-life-jenkins:v1 --pull=true --file=Dockerfile ${WORKSPACE}

    '''
        }
    }
   stage('Push docker image') {
     steps {
     sh '''
       docker login --username mudaykumar --password 19124909@a
       docker push mudaykumar/game-of-life-jenkins:v1
      '''
           }
    }
          
    
        
        
    }
}
