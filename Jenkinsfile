node {
  stage('SCM checkout') {
    git 'https://github.com/Thegaijin/PiggyMetrics.git'
  }

  environment {
    CONFIG_SERVICE_PASSWORD=credentials("CONFIG_SERVICE_PASSWORD")
    NOTIFICATION_SERVICE_PASSWORD=credentials("NOTIFICATION_SERVICE_PASSWORD")
    STATISTICS_SERVICE_PASSWORD=credentials("STATISTICS_SERVICE_PASSWORD")
    ACCOUNT_SERVICE_PASSWORD=credentials("ACCOUNT_SERVICE_PASSWORD")
    MONGODB_PASSWORD=credentials("MONGODB_PASSWORD")
  }

  stage('compiler, tester, packager') {
    def mvnHome = tool name:'M3', type: 'maven'
    def mvnCMD = "${mvnHome}/bin/mvn"
    sh "${mvnCMD} clean package"
  }

  stage('Build docker images') {
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