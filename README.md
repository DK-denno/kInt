
# Kyosk Interview

## How To Run Code
- Clone the repository or simply input in your terminal
    ```git clone https://github.com/DK-denno/kInt.git```
    -
- Go into the folder containing the codebase
    ```cd kInt```
    -
- Install Dependencies
    ```mvn clean install -DskipTests```
- Run Code
    ```mvn spring-boot:run``` 
    -
**```A default port "8080" is used```**
    

## How Build the Docker image
- In the root folder run the command
    ```docker build -f Dockerfile -t kyosk/interview-demo:latest .```
    -
- This build a docker image locally and give it a tag as passed above :-
    ```kyosk/interview-demo:latest```

## How to Run The Docker Iamge
- Run Code in your terminal
    ```docker run -d --name kyosk_interview --restart unless-stopped -p 8080:8080  kyosk/interview-demo:latest```
    -
**```The image generated locally is used```**

- To Login to the docker registry on docker hub
    ```docker login -u kyoskinterview ```
    -
- Use this **READ ONLY** token to login to the registry
    ```dckr_pat_SlhdEwjgq8ksUruJaEc6-18FIEQ```
    -
- Run Code in your terminal
    ```docker run -d --name kyosk_interview --restart unless-stopped -p 8080:8080  kyoskinterview/interview-demo:latest```
    -
**```The image pushed on docker hub is used```**


## How Recreate the Kubernetes Service and Apps Used
### Pre-requisites
- Docker
- Kubernetes
- Minikube
- Kubectl cli

#### Recreate Kubernetes Pod With a amanifest
- Create a file **deployent.yml** or use the existing one in codebase shared
    ```cd deployment-scripts```
    -
- Apply the changes in the file created.
    ```kubectl apply -f deployment.yml```
    -

**```This creates a pod within kubernetes```**

#### Recreate Kubernetes Service With a amanifest
- Create a file **service.yml** or use the existing one in codebase shared
    ```cd deployment-scripts```
    -
- Apply the changes in the file created.
    ```kubectl apply -f service.yml```
    -
- Confirm thet your service is running
    ```kubectl get services``` 
    -

**```This creates a service within kubernetes```**


## AutoDeployment
- An auto deployment has been used in the github workflows directory
    ```/.github/workflows```
    -
- The main trigger is a push or merge to the main branch.
- The code auto builds and pushes to the docker hub acc set up in the secrets on github

