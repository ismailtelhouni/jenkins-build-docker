node {
    def registryProject = 'registry.gitlab.com/ismailtelhouni123/firstproject'
    def image = "${registryProject}:version-${BUILD_ID}"
    def img

    stage("Clone") {
        // git branch: 'main', url: 'https://github.com/ismailtelhouni/jenkins-build-docker.git'
        checkout scm
    }

    stage("Build") {
        img = docker.build(image, '.')
    }

    stage("Run") {
        img.withRun("--name run-${BUILD_ID} -p 80:80") { c ->
            sh 'curl localhost'
        }
    }
    
    stage("Test Docker Login") {
        withCredentials([usernamePassword(credentialsId: 'reg1', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
            sh 'echo $PASSWORD | docker login registry.gitlab.com -u $USERNAME --password-stdin'
        }
    }

    stage("Push") {
        withDockerRegistry(credentialsId: 'reg1', url: 'https://registry.gitlab.com') {
            img.push()
        }
    }
}
