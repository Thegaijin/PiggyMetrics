// pipeline {
//   agent {
//       label "macos"
//   }
//   tools {
//     maven "Maven3.5.3"
//     jdk "java8"
//   }
//   stages {
//     stage('checkout') {
//       git 'https://github.com/Thegaijin/PiggyMetrics.git'
//     }

//     stage('compiler, tester, packager') {
//       sh 'mvn clean package'
//     }

//     stage('archival') {
//       archiveArtifacts 'account-service/target/*.jar, config/target/*.jar, auth-service/target/*.jar, gateway/target/*.jar, monitoring/target/*.jar, notification-service/target/*.jar, registry/target/*.jar, statistics-service/target/*.jar'
//     }
//   }
// }

// node {

//     try {
//         stage('checkout') {
//             git 'https://github.com/Thegaijin/PiggyMetrics.git'
//         }

//             stage('compiler, tester, packager') {
//         sh 'mvn clean package'
//         }

//         stage('archival') {
//             archiveArtifacts 'account-service/target/*.jar, config/target/*.jar, auth-service/target/*.jar, gateway/target/*.jar, monitoring/target/*.jar, notification-service/target/*.jar, registry/target/*.jar, statistics-service/target/*.jar'
//         }
//     } catch (err) {
//         echo "Caught: ${err}"
//         currentBuild.result = 'FAILURE'
//     }
// }

node {
  stage('SCM checkout') {
    git 'https://github.com/Thegaijin/PiggyMetrics.git'
  }

  stage('compiler, tester, packager') {
    def mvnHome = tool name:'maven-3', type: 'maven'
    def mvnCMD = "${mvnHome}/bin/mvn"
    sh "${mvnCMD} clean package"
  }

  stage('Build docker images') {
    sh 'docker-compose -f docker-compose.yml -f docker-compose.dev.yml up'
  }

  stage('login to dockerhub') {
    withCredentials([string(credentialsId: 'docker-pwd', variable: 'dockerhubpwd')]) {
    sh 'docker login -u thegaijin -p ${dockerhubpwd}'
    }
  }

  // stage('Push images to dockerhub') {
  //   sh 'docker-compose push'
  // }

}