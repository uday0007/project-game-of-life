pipeline 
{
   agent any

   tools
   {
      // Install the Maven version configured as "M3" and add it to the path.
	  jdk 'JAVA'
      maven "MAVEN"
   }
   environment
   {

      sonar_url = 'http://localhost:9000'
      sonar_username = 'admin'
      sonar_password = 'admin'
   }

   stages
   {
   stage('checkout')
   {
         steps 
		 {
            // Get some code from a GitHub repository
            git 'https://github.com/uday0007/project-game-of-life.git'
         }
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
    stage ('sonarqube')
    {
            steps 
		{
            withSonarQubeEnv('SonarQube')
			{
            sh '''
            mvn clean package org.jacoco:jacoco-maven-plugin:prepare-agent install -Dmaven.test.failure.ignore=false
            mvn -e -B sonar:sonar -Dsonar.java.source=1.8 -Dsonar.host.url="${sonar_url}" -Dsonar.login="${sonar_username}" -Dsonar.password="${sonar_password}" -Dsonar.sourceEncoding=UTF-8
            '''			
            }
	   	}
    }
	stage ('Docker build') {
   steps {
   sh '''
      cd ${WORKSPACE}
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
