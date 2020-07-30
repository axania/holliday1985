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
           deploy adapters: [tomcat8(credentialsId: 'adminID', path: '', url: 'http://35.182.5.210:8080/')], contextPath: 'summer', war: '**/*.war'
            sshPublisher(publishers: [sshPublisherDesc(configName: 'docker-hosts', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: 'docker rmi -f demo1:1.0; docker build -t demo1:1.0 .; docker tag demo1:1.0 calvin2019/demo1:1.0; docker push calvin2019/demo1:1.0', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '', remoteDirectorySDF: false, removePrefix: 'webapp/target', sourceFiles: '**/*.war')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])
           
           
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

