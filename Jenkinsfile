node {
    def app

    stage('Clone repository') {
        checkout scm
    }

    stage('Build image') {
        app = docker.build('quay.io/sjturner62/example-app')
    }

    stage('Test') {
        app.inside {
            sh 'npm test'
        }
    }

    stage('Push image') {
        docker.withRegistry('https://quay.io', 'quay-io-credentials') {
            app.push("${env.BRANCH_NAME}-latest")
            app.push("${env.BRANCH_NAME}-${env.BUILD_NUMBER}")
        }
    }
}