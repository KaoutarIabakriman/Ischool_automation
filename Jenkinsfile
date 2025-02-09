pipeline {
    agent any
    stages {
        stage('Build Ischool') {
            steps {
                checkout scmGit(
                    branches: [[name: '*/main']],
                    extensions: [],
                    userRemoteConfigs: [[url: 'https://github.com/KaoutarIabakriman/Ischool_automation']]
                )
            }
        }
        stage('Build docker image') {
            steps {
                script {
                    sh 'docker build -t ischool-app .'
                }
            }
        }
        stage('Push image to Hub') {
            steps {
                script {
                    // Log in to Docker Hub using credentials
                    withCredentials([string(credentialsId: 'dockerhub-pwd', variable: 'dockerhubdpwd')]) {
                        sh "docker login -u kaoutar185 -p ${dockerhubdpwd}"
                    }
                    // Tag the image with the Docker Hub repository name
                    sh 'docker tag ischool-app kaoutar185/ischool-app'
                    // Push the image to Docker Hub
                    sh 'docker push kaoutar185/ischool-app'
                }
            }
        }
    }
}
