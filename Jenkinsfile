node {
  checkout scm
 }

pipeline{ 
 agent any
   
 stages{
     stage('Build Java Artifact'){
       steps{
         echo "Hello"
       }
     }
     stage('Build and Push Docker Image'){
       steps{
         docker ps
       }
     }
   }
}
