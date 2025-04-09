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

# strp-2

to deploy the project with pm2
* sudo npm install -g pm2

"Create an ecosystem file with PM2 to serve static files."
* sudo nano /opt/deployment/react/ecosystem.config.js
* 



