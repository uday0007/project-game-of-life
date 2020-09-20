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
   stage("build & SonarQube analysis") {
           
              withSonarQubeEnv('sonarqube') {
                 sh 'mvn clean package sonar:sonar'
              }
         }
          
    
        
        
    }
}
