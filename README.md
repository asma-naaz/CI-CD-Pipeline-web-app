# TASK - 2
# CI-CD-Pipeline-web-app

github repository: https://github.com/kabirbaidhya/react-todo-app

# step-1

launch an EC2 instance (ubuntu)
* sudo apt update -y
* install nodejs and npm sudo apt install nodejs npm -y
* install git and make a directory  sudo mkdir -p /opt/checkout/react-todo-add
cd /opt/checkout/react-todo-add
sudo git clone https://github.com/kabirbaidhya/react-todo-app.git .

to build the project install dependencies
*sudo npm install

to build the project 
* sudo npm run build
* ls build
* sudo mkdir -p /opt/deployment/react
* sudo mv build/* /opt/deployment/react/
* ls /opt/deployment/react

# step-2 to deploy the project with pm2

* sudo npm install -g pm2

"Create an ecosystem file with PM2 to serve static files."
* sudo nano /opt/deployment/react/ecosystem.config.js

to start the process pm2
*pm2 start /opt/deployment/react/ecosystem.config.js

to check the process is working
pm2 status
pm2 startup
pm2 save

# step-3 serve the project with Nginx Proxy

* sudo apt update
* sudo apt install nginx -y
* sudo systemctl start nginx
* sudo systemctl enable nginx
* sudo systemctl status nginx

edit the default nginx configuration file
* sudo nano /etc/nginx/sites-available/react-todo

server {
listen 80;
server_name _;
location / {
proxy_pass http://localhost:3000;
proxy_http_version 1.1;
proxy_set_header Upgrade $http_upgrade;
proxy_set_header Connection 'upgrade';
proxy_set_header Host $host;
proxy_cache_bypass $http_upgrade;
}

* sudo ln -s /etc/nginx/sites-available/react-todo /etc/nginx/sites-enabled/
* sudo rm /etc/nginx/sites-enabled/default
* sudo nginx -t
* sudo systemctl reload nginx

setup UFW (firewall rules)
* sudo apt install ufw -y
* sudo ufw default deny incoming
* sudo ufw default allow outgoing
* sudo ufw allow 22
* sudo ufw allow 80
* sudo ufw allow 443
* sudo ufw allow 3000
* sudo ufw enable

# final test 
Access http://13.233.247.140:3000/ in the browser. The React Todo App should be served successfully.

# setup-4 a jenkins for CI-CD pipeline

* sudo apt update -y
* sudo apt install openjdk-21-jdk -y
* sudo wget -O /usr/share/keyrings/jenkins-keyring.asc
https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]
https://pkg.jenkins.io/debian-stable binary/" | sudo tee
/etc/apt/sources.list.d/jenkins.list > /dev/null
* sudo apt-get update
* sudo apt-get install jenkins
* sudo systemctl start jenkins
* sudo systemctl enable jenkins
* sudo ufw allow 8080

now access the jenkins on port number 8080

* create a pipeline job
* pipeline used in the project is mentioned above in the pipeline file
* now go and check on the browser http://13.233.247.140 

# step-5 Docker (Generate React App Build Files)

* sudo chown -R devops:devops /opt/checkout/react-todo-add
* sudo chmod -R 775 /opt/checkout/react-todo-add
* sudo rm -rf /opt/checkout/react-todo-add/node_modules
* cd /opt/checkout/react-todo-add
* npm install
* npm rub build

create a Dockerfile 
* nano Dockerfile (mentioned in the above dockerfile)
  
to manage the react app create docker-compose.yaml
Now we will change the port to create containers because port 3000 is already being used by a Node.js process.
* docker-compose build
* nano docker-compose.yml
* docker-compose up -d

# Now our application is also accessible on port 3001.

#NOTE : 
# Configured a GitHub webhook to trigger the Jenkins pipeline automatically on every code commit.
# Used AWS S3 to upload and store the React app build files for deployment.

# Benefits of the Project:

1. Containerized Application:
Your React application is now fully containerized, ensuring consistency across
development, testing, and production environments. Eliminates the "works on my machine" problem by using Docker.

2. Simplified Deployment:
With Docker Compose, starting, stopping, and managing the applicationis
simplified using a single command (docker-compose up -d). Automated dependency handling for the application (e.g., Node.js).

3. Portability:
The app can now run on any platform that supports Docker, making it highlyportable. Easy migration to cloud services or on-premise infrastructure.

4. Resource Efficiency:
Containers consume fewer resources compared to traditional virtual machines. Multiple containers can run on the same host, optimizing hardware usage.

5. Scalability:
The containerized setup can be easily scaled horizontally by increasing
container replicas.
Integration with orchestration tools like Kubernetes or Docker Swarmfor
larger deployments.

6. Fault Isolation:
Issues in one container (e.g., application bugs) don’t affect other services or
containers on the host.

7. Improved CI/CD Integration:
The project is well-suited for CI/CD pipelines due to its containerized nature. Automates build, deployment, and testing processes, reducing manual
intervention.






















 















