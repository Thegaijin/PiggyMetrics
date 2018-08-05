node {
  agent {
    docker {
      image 'thegaijin/jenkins-docker'
      args '-v /usr/local/bundle:/usr/local/bundle -v /run/docker.sock:/var/run/docker.sock'
    }
  }
  environment {
    CONFIG_SERVICE_PASSWORD=123456789
    NOTIFICATION_SERVICE_PASSWORD=123456789
    STATISTICS_SERVICE_PASSWORD=123456789
    ACCOUNT_SERVICE_PASSWORD=123456789
    MONGODB_PASSWORD=123456789
  }

  stage('SCM checkout') {
    git 'https://github.com/Thegaijin/PiggyMetrics.git'
  }

  stage('compiler, tester, packager') {
    def mvnHome = tool name:'M3', type: 'maven'
    def mvnCMD = "${mvnHome}/bin/mvn"
    sh "${mvnCMD} clean package"
  }

  stage('Build docker images') {
    sh 'whoami'
    sh 'docker-compose -f docker-compose.yml -f docker-compose.dev.yml build'
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