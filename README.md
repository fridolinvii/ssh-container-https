# Website Hosting
You can follow this step-by-step guide on how to host this website on your Ubuntu server so that it will be accessible with HTTPS and gives an overview of the links from your Researchgate, LinkedIn, and GitHub account.

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

## Step 4 - Start
I followed the instruction of [nginx-proxy/acme](https://github.com/nginx-proxy/acme-companion) and summarized it for my needs.
Execute 
```
./build.sh
```
and follow the instruction. This will build you three dockers. 
After a few moments you can use it for e.g., a Reverse SSH

