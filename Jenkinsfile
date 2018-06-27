// pipeline {

//     agent {
//       docker {
//         image 'thegaijin/jenkins-docker'
//         args '-v /usr/local/bundle:/usr/local/bundle -v /run/docker.sock:/var/run/docker.sock'
//       }
//     }
//     environment {
//       CONFIG_SERVICE_PASSWORD=credentials("CONFIG_SERVICE_PASSWORD")
//       NOTIFICATION_SERVICE_PASSWORD=credentials("NOTIFICATION_SERVICE_PASSWORD")
//       STATISTICS_SERVICE_PASSWORD=credentials("STATISTICS_SERVICE_PASSWORD")
//       ACCOUNT_SERVICE_PASSWORD=credentials("ACCOUNT_SERVICE_PASSWORD")
//       MONGODB_PASSWORD=credentials("MONGODB_PASSWORD")
//     }
//     stages {
//       stage('SCM checkout') {
//         steps {
//           git url: 'https://github.com/Thegaijin/PiggyMetrics.git'
//         }
//       }
//       // stage('Add maven') {
//       //   steps {
//       //     env.PATH = "${tool 'M3'}/bin:${env.PATH}"
//       //   }
//       // }

//       // stage('Configure file path') {
//       //   steps {
//       //     configFileProvider(
//       //         [configFile(fileId: 'maven-settings', variable: 'MAVEN_SETTINGS')]) {
//       //         sh 'mvn -s $MAVEN_SETTINGS clean package'
//       //     }
//       //   }
//       // }


//       // stage('compiler, tester, packager') {
//       //   sh 'mvn clean package'
//       // }


//       //       stage('check maven') {
//       //   steps {
//       //     withEnv(["PATH+MAVEN=${tool 'M3'}/bin"]) {
//       //       sh 'mvn -B verify'
//       //     }
//       //   }
//       // }

//       // stage('check maven') {
//       //   // tools {
//       //   //   maven "maven3.3.9"
//       //   // }
//       //   steps {
//       //     echo "This time, the Maven version should be 3.3.9"
//       //     sh "mvn -version"
//       //   }
//       // }

//       // stage('compile, test, package') {
//       //   steps {
//       //     echo "WTF"

//       //     sh "${mvnHome}/bin/mvn clean package"
//       //     }
//       //   }
//       // }

//     // sh 'mvn clean package'
//         // tools {
//         //   maven 'maven-3"
//         // }
//         // steps {
//         //   def mvn_version = "maven-3"
//         //   withEnv( ["PATH+MAVEN=${tool mvn_version}/bin"] ) {
//         //     sh "mvn clean package"
//         //   }
//         //   def mvnHome = tool name: 'maven-3', type: 'maven'
//         //   def mvnCMD = "${mvnHome}/bin/mvn"
//         //   sh 'mvn clean package'
//         // }

//       stage('Build docker images') {
//         steps {
//           sh 'docker-compose -f docker-compose.yml -f docker-compose.dev.yml up'
//         }
//       }

//       stage('login to dockerhub') {
//         steps {
//           withCredentials([string(credentialsId: 'docker-pwd', variable: 'dockerhubpwd')]) {
//           sh 'docker login -u thegaijin -p ${dockerhubpwd}'
//           }
//         }
//       }

//       stage('Push images to dockerhub') {
//         steps {
//           sh 'docker-compose push'
//         }
//       }
//     }
// }

node {
  stage('SCM checkout') {
    git 'https://github.com/Thegaijin/PiggyMetrics.git'
  }

  stage('compiler, tester, packager') {
    def mvnHome = tool name:'M3', type: 'maven'
    def mvnCMD = "${mvnHome}/bin/mvn"
    sh "${mvnCMD} clean package"
  }

  environment {
    CONFIG_SERVICE_PASSWORD=credentials("CONFIG_SERVICE_PASSWORD")
    NOTIFICATION_SERVICE_PASSWORD=credentials("NOTIFICATION_SERVICE_PASSWORD")
    STATISTICS_SERVICE_PASSWORD=credentials("STATISTICS_SERVICE_PASSWORD")
    ACCOUNT_SERVICE_PASSWORD=credentials("ACCOUNT_SERVICE_PASSWORD")
    MONGODB_PASSWORD=credentials("MONGODB_PASSWORD")
  }

  stage('Build docker images') {
    sh 'docker-compose -f docker-compose.yml -f docker-compose.dev.yml up'
  }

  stage('login to dockerhub') {
    withCredentials([string(credentialsId: 'docker-pwd', variable: 'dockerhubpwd')]) {
    sh 'docker login -u thegaijin -p ${dockerhubpwd}'
    }
  }

  stage('Push images to dockerhub') {
    sh 'docker-compose push'
  }
}
