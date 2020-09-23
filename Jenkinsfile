pipeline {
    agent any
    triggers {
        cron('H */1 * * * ')
     }
    tools {
        maven 'M2_HOME'
      
    }
    stages {
      stage('Build'){
        steps {
          echo "Build step"
          sh 'mvn clean'
          sh 'mvn install'
          sh 'mvn package'
        }
      
      
      }
        stage('test '){
        steps {
            retry(1){
          echo  "test step"
            }
          sh 'mvn test'
        }
      
      
      }
        stage('deploy'){
        steps {
           deploy adapters: [tomcat8(credentialsId: 'TomcatID', path: '', url: 'http://99.79.10.238:8080/')], contextPath: 'serge', war: '**/*.war'
           
           
        }
      
      
      }
    
    }
    post {
        always {
            echo "Always display this message "
        }
        failure {
            echo "Job failed "
        }
        success {
            echo "Successful run "
        }
        unstable {
            echo "The job is unstable "
        }
    } 

}

