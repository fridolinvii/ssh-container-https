# SSH Container Hosting
This guide explains how to set up an SSH container that can create a secure reverse SSH tunnel 
from your local server to a publicly accessible server. 
This setup is particularly useful when you need to access resources on a local server via a server that is open to the internet.

By sharing resources over the SSH tunnel, your data will be encrypted (using HTTPS), 
and the IP address of your local server will remain hidden.


## Step 1 - Domain
Get a domain, for example from [namecheap.com](https://www.namecheap.com). Choose your domain, e.g., `yourdomain.xyz`.
Next, set up an A Record with the Host as `@` (or a specific prefix you want to use, e.g., `www`) and the Value as your IP address.

## Step 2 - Install
Install the packages needed
```
sudo apt install docker.io npm git nano
npm install --global yarn
```
And pull the GitHub repository
```
git pull git@github.com:fridolinvii/ssh-container-https.git
```
and enter the folder. 
```
cd ssh-container-https
```

## Step 3 - Setup
This gives the parameters to build the dockers. Copy the _.env.template_ to _.env_, and edit them accodingly to your wishes. 
Copy:
```
cp .env.template .env
```
Edit:
```
nano .env
```

## Step 4 - SSH-Key
Create a SSH key on your local server:
```
ssh-keygen -t ed25519
```
Copy the public key into the file
`authorized_keys`


## Step 5 - Start
I followed the instruction of [nginx-proxy/acme](https://github.com/nginx-proxy/acme-companion) and summarized it for my needs.
Execute 
```
./build.sh
```
and follow the instruction. This will build you three dockers. 
After a few moments you can use it for e.g., a Reverse SSH

A reverse SSH tunnel from your local server to the publicly accesible server can be created by entering the command similar to:
```
ssh -i PATH_PRIVATE_KEY -tt -R PORT_LOCAL:0.0.0.0:PORT_GLOBAL user@DOCKER_SITE_ADDRESS -p PORT_SSH 
```
