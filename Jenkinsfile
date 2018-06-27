pipeline {

    agent {
      docker {
        image 'thegaijin/jenkins-docker'
        args '-v /usr/local/bundle:/usr/local/bundle -v /run/docker.sock:/var/run/docker.sock'
      }
    }
    tools {
        maven "maven3.3.9"
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

      stage('compile') {
        tools {
          maven "maven3.3.9"
        }
        steps {
          echo "This time, the Maven version should be 3.3.9"
          def MAVEN=/usr/share/maven
          def PATH=$M2_HOME/bin
          sh "mvn -version"
        }
        // steps {
        // def maven = 'maven3.3.9'
        // }
      }

      stage('test, package') {
        steps {
          withEnv( ["PATH+MAVEN=${tool maven}/bin/mvn/"] ) {
            sh 'mvn clean package'
          }
        }
      }
    }

    // sh 'mvn clean package'
        // tools {
        //   maven 'maven-3"
        // }
        // steps {
        //   def mvn_version = "maven-3"
        //   withEnv( ["PATH+MAVEN=${tool mvn_version}/bin"] ) {
        //     sh "mvn clean package"
        //   }
        //   def mvnHome = tool name: 'maven-3', type: 'maven'
        //   def mvnCMD = "${mvnHome}/bin/mvn"
        //   sh 'mvn clean package'
        // }

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