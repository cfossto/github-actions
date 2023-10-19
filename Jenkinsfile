node {
  checkout scm
 }

pipeline{ 
 agent any

  environment {
    CURRENT_AUTHOR = "Christopher built this ${env.BUILD_TAG}"
  }
   
 stages{
     stage('Build Java Artifact'){
       steps{
         echo "Hello"
       }
     }
     stage('Build and Push Docker Image'){
       steps{
         echo "${env.CURRENT_AUTHOR}"
       }
     }
   }
}
