pipeline {
  agent any

  environment {
    DOCKER_USER='nohierhassan'
    DOCKER_PASS=credentials('DOCKER_PASS')
  }
  stages {

    stage('Build') {
      steps {

        sh ''' 
            ./scripts/build/build-jar.sh mvn -B -DskipTests clean package
            ./scripts/build/build-image.sh
          '''
  
      }
      
    }

    stage('Test') {
      steps {
          sh ''' 
            ./scripts/test/test-jar.sh mvn test
          '''
      }
      
    }

    stage('Pushing') {

      steps{

        sh '''
            ./scripts/push/push-iamge.sh $DOCKER_USER $DOCKER_PASS
            
           '''
      }
    }

    stage('Deploy') {
      steps {
        
          sh ''' 
              ./scripts/deploy/changeTag.sh $BUILD_NUMBER
          '''
          sshagent(['kops-master-key']) {
            sh "scp -o StrictHostKeChecking=no /scripts/deploy/java-app-pod.yml admin@18.215.126.133"
          }
          script{
            try {
                sh "ssh admin@18.215.126.133 kubectl apply -f ."
            }catch(error){
                 sh "ssh admin@18.215.126.133 kubectl apply -f ."
            }
          }
      }
      
    }
  }

}