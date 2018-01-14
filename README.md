# About
This is a docker container which contains Jenkins, the `docker` client, and `docker-compose`.

# Usage
```
docker run -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home \
	-v /var/run/docker.sock:/var/run/docker.sock agoston/jenkins-docker:xenial
```
This will start Jenkins on port 8080.
