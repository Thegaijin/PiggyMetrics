pipeline {

    agent {
      docker {
        image 'thegaijin/jenkins-docker'
        args '-v /usr/local/bundle:/usr/local/bundle -v /run/docker.sock:/var/run/docker.sock'
      }
    }

    environment {
      CONFIG_SERVICE_PASSWORD=credentials("CONFIG_SERVICE_PASSWORD")
      NOTIFICATION_SERVICE_PASSWORD=credentials("NOTIFICATION_SERVICE_PASSWORD")
      STATISTICS_SERVICE_PASSWORD=credentials("STATISTICS_SERVICE_PASSWORD")
      ACCOUNT_SERVICE_PASSWORD=credentials("ACCOUNT_SERVICE_PASSWORD")
      MONGODB_PASSWORD=credentials("MONGODB_PASSWORD")
    }
    stages {

      stage('SCM checkout') {
        steps {
          git 'https://github.com/Thegaijin/PiggyMetrics.git'
        }
      }
    }
    //   stage('compiler, tester, packager') {
    //     steps {
    //       def mvnHome = tool name:'maven-3', type: 'maven'
    //       def mvnCMD = "${mvnHome}/bin/mvn"
    //       sh "${mvnCMD} clean package"
    //     }
    //   }

    //   stage('Build docker images') {
    //     steps {
    //       sh 'docker-compose -f docker-compose.yml -f docker-compose.dev.yml up'
    //     }
    //   }

    //   stage('login to dockerhub') {
    //     steps {
    //       withCredentials([string(credentialsId: 'docker-pwd', variable: 'dockerhubpwd')]) {
    //       sh 'docker login -u thegaijin -p ${dockerhubpwd}'
    //       }
    //     }
    //   }

    //   stage('Push images to dockerhub') {
    //     steps {
    //       sh 'docker-compose push'
    //     }
    //   }
    // }
}

// node {
//   stage('SCM checkout') {
//     git 'https://github.com/Thegaijin/PiggyMetrics.git'
//   }

//   stage('compiler, tester, packager') {
//     def mvnHome = tool name:'maven-3', type: 'maven'
//     def mvnCMD = "${mvnHome}/bin/mvn"
//     sh "${mvnCMD} clean package"
//   }

//   environment {
//     CONFIG_SERVICE_PASSWORD=credentials("CONFIG_SERVICE_PASSWORD")
//     NOTIFICATION_SERVICE_PASSWORD=credentials("NOTIFICATION_SERVICE_PASSWORD")
//     STATISTICS_SERVICE_PASSWORD=credentials("STATISTICS_SERVICE_PASSWORD")
//     ACCOUNT_SERVICE_PASSWORD=credentials("ACCOUNT_SERVICE_PASSWORD")
//     MONGODB_PASSWORD=credentials("MONGODB_PASSWORD")
//   }

//   stage('Build docker images') {
//     sh 'docker-compose -f docker-compose.yml -f docker-compose.dev.yml up'
//   }

//   stage('login to dockerhub') {
//     withCredentials([string(credentialsId: 'docker-pwd', variable: 'dockerhubpwd')]) {
//     sh 'docker login -u thegaijin -p ${dockerhubpwd}'
//     }
//   }

//   stage('Push images to dockerhub') {
//     sh 'docker-compose push'
//   }

// }