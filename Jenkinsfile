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
          
    stage("publish artifactory") {
        
    nexusArtifactUploader artifacts: [[artifactId: 'gameoflife', classifier: '', file: '/var/lib/jenkins/workspace/pipeline-project/gameoflife-build/target/gameoflife-build-1.0-SNAPSHOT.jar', type: 'jar']], credentialsId: '3.8.20200310-130318.c482b58', groupId: 'com.wakaleo.gameoflife', nexusUrl: 'localhost:8081', nexusVersion: 'nexus3', protocol: 'http', repository: 'release', version: '4.0.0'
    }
        
        
    }
}
