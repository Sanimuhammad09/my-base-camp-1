# Welcome to My Basecamp 1
***

## Task
The task is to create a web application based on MVC that has:
1. A user model
2. A project model

## Description
The user controller should be able to create, update, show and delete users.
The project controller should be to create, edit, show and delete projects
The users should have role permission:
1. Basic user can only create a project and have access to only project created by the user
2. Admin can have access to all projects, can view all users and can change the roles of users

## Installation
The project is created using ruby on rails and can be used via
1. the browser run the command rails s on cmd and use the url: http://localhost:3000 on the browser
2. through cmd(Linux) using the command: rails c or rails console

## Usage
To start the app cd into the app directoty and run the command rails s or rails server

## Note
To register a user as an admin(admin can only be created on the console):
1. run the command rails console
2. User.create(Email= "email address", First_name:"first name", Last_name: "last name", isAdmin: true, password: "password") e.g
User.create(Email= "pyz@gmail.com", First_name:"Temitope", Last_name: "Oluwaseyi", isAdmin: true, password: "temitope")

OR use can login as admin using the credential
email: admin@gmail.com
password: admin

### The Core Team
Fakile Temitope
Sani Muhammad


<span><i>Made at <a href='https://qwasar.io'>Qwasar SV -- Software Engineering School</a></i></span>
<span><img alt='Qwasar SV -- Software Engineering School's Logo' src='https://storage.googleapis.com/qwasar-public/qwasar-logo_50x50.png' width='20px'></span>
