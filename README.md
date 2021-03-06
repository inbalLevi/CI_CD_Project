

## CI/CD Pipeline with azure devops 
Configure CI/CD pipelines to deploy the Node Weight Tracker application for 2 environments: Staging and Production. </br>
### The goal:
![image](https://user-images.githubusercontent.com/71599740/140197294-11143f63-c432-4c57-b5b7-13827e8c9075.png)

### Welcome To azure devops!
![image](https://user-images.githubusercontent.com/71599740/140197381-d21ebd72-8d92-49ac-9d9e-de9fb732c762.png)

There are 2 pipelines:
CI pipeline - creating an artifact and uploading to Artifactory
CD Pipeline - Downloading the LTS artifact from artifactory and running the new app.

## STEPS:
* Configure an agent: [agent-pool](https://www.youtube.com/watch?v=psa8xfJ0-zI&ab_channel=Raaviblog)
* Run the agent as a systemd service: [service](https://docs.microsoft.com/en-us/azure/devops/pipelines/agents/v2-linux?view=azure-devops)
* Import a project repository [Weight Tracker](https://github.com/inbalLevi/bootcamp-app)
* Create a new artifacts feed
* Created the build pipeline using the visual editor
* Selected the imported repository as build sources - GITHUB
* Selected the "Empty Job" template
* Configured the pipeline to run in the agent-pool (CI)
* Configure CI Trigger: Enable continuous integration   => If you would like to make a change to the app push the new commit to the master branch and the pipelines will do the rest
* Create these tasks:
![image](https://user-images.githubusercontent.com/71599740/140198092-31a20969-253c-459f-9535-af7b9beea8eb.png)
![image](https://user-images.githubusercontent.com/71599740/140198120-de257079-6870-492b-97d7-f74382bc6521.png)
![image](https://user-images.githubusercontent.com/71599740/140198146-ffb913cb-d176-4c0a-bbf5-df2235b9057a.png)
* Click on "add a new artifact" and add [ansible-repo](https://github.com/inbalLevi/CI_CD_Ansible)
 ![image](https://user-images.githubusercontent.com/71599740/140198353-9679236a-b805-499f-af56-4ef1bdc9b96b.png)
 ![image](https://user-images.githubusercontent.com/71599740/140198412-47fe53e3-0928-4ca0-954a-62766aa70a5f.png)
* Create a release pipeline definition -Click on "add a new artifact"
* Configure the artifact trigger: Continuous deployment trigger: Enabled
* Create a file creator that set the variables by the correct group - staging / prod
![image](https://user-images.githubusercontent.com/71599740/140198643-f4f3ddf8-ee2c-476e-9354-a55e3ed04c0c.png)
* Create the group variables and edit them: ![image](https://user-images.githubusercontent.com/71599740/140198710-d53c63da-bc5a-49ad-8539-a9da0e9cffa2.png)
* Copy the application artifact to the remote machines (vm-staging1 and vm-staging2)
![image](https://user-images.githubusercontent.com/71599740/140198939-3ecc2da3-c7d4-4156-82cf-754f0adcbb74.png)
* Then run the playbook:
![image](https://user-images.githubusercontent.com/71599740/140199003-be1d5eea-43b3-4215-88c1-2db241863fe2.png)
![image](https://user-images.githubusercontent.com/71599740/140199039-69846f1a-7eb9-47f6-9cc9-f17c9c38ae5f.png)

* finally this is the full ci-cd:
![image](https://user-images.githubusercontent.com/71599740/140199166-fac63c90-8781-4394-8dcb-7dd1587503e5.png)

![staging](https://user-images.githubusercontent.com/71599740/140199673-2fa5437c-cd46-40ec-acdf-889e0a97b788.PNG)
![prod](https://user-images.githubusercontent.com/71599740/140199721-424b543a-9517-4f74-99c4-f2a21ad6c287.PNG)


If you would like to make a change to the app push the new commit to the master branch and the pipelines will do the rest :)


# Emphasis:
* To provision the infrastructure I've used my previous project: </br>
The Ansible repository - https://github.com/inbalLevi/CI_CD_Ansible </br>
The terraform repository - https://github.com/inbalLevi/CI_CD_Terraform </br>
* To install all dependencies on the nodes and to deploy and run the application for the first time I've used this project - https://github.com/inbalLevi/bootcamp-app

















 


