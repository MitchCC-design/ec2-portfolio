# EC2 Portfolio Website  

This repository contains the automated deployment script and configuration for a professional portfolio website hosted on AWS EC2. The project leverages AWS cloud infrastructure to provide a scalable, efficient, and fully automated web hosting solution.

## Project Overview  

This project is designed to deploy a minimalistic and professional portfolio website using an AWS EC2 instance. The deployment is automated via an EC2 User Data script, which ensures that upon instance launch:
- The system is updated, and necessary dependencies are installed.
- Apache is configured and started to serve the portfolio webpage.
- A custom HTML-based portfolio website is deployed dynamically.

The project demonstrates infrastructure automation principles and provides a structured approach to hosting static web content on AWS.

## Features  

- Automated EC2 Setup – No manual configuration required.  
- Minimalist and Professional Web Design – A clean, responsive portfolio layout.  
- Cloud-Native Deployment – Hosted on AWS EC2 with an automated setup process.  
- Scalability and Availability – Easily extendable for high availability configurations.  
- Version-Controlled – The project is managed through Git for structured development and updates.  

## Technology Stack  

- AWS EC2 – Cloud-based compute instance for hosting the website.  
- Amazon Linux 2 – The operating system used for the EC2 instance.  
- Apache HTTP Server – Web server configured to serve static HTML content.  
- Bash Scripting – Used for automation via the EC2 User Data script.  
- Terraform – Infrastructure as Code (IaC) for provisioning AWS resources.  
- Git & GitHub – Version control and remote repository management.  

## Deployment Instructions  

### Deploy via AWS Management Console 

1. Launch a new AWS EC2 instance and select Amazon Linux 2 as the AMI.  
2. Configure instance settings and security groups to allow inbound HTTP (port 80) traffic.  
3. In the Advanced Details section, copy the contents of `user-data.sh` and paste it into the User Data field.  
4. Launch the instance and wait for the initialization process to complete.  
5. Retrieve the Public IP Address of the EC2 instance from the AWS console and access the portfolio website via a web browser.  

### Deploy via AWS CLI 

To deploy the EC2 instance using the AWS CLI, use the following command (update with the appropriate values):  

```bash
aws ec2 run-instances \
  --image-id ami-xxxxxxxxxxxxx \
  --count 1 \
  --instance-type t2.micro \
  --key-name MyKeyPair \
  --security-group-ids sg-xxxxxxxxxxxxx \
  --subnet-id subnet-xxxxxxxxxxxxx \
  --user-data file://user-data.sh
