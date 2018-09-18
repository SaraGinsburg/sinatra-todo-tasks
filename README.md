
# Welcome to todo-tasks, a Sinatra application!

# Prospective Users
The app is designed to be used by anyone who wants to record projects to be done, break them down to tasks with respective descriptions.  


A user will not be able to modify, add or delete someone else's projects or tasks.

enjoy!

# Objective
The todo-tasks app provides a database and web interface for users to:

Sign up as a User
Users can log in and perform CRUD actions on projects and their associated tasks.
Each user can ONLY modify content of their own project and tasks
User inputs are validated for user/project/task creation

# Usage instructions
After cloning the repository, run bundle install to install Ruby gem dependencies.

You can start the server using the shotgun command, shotgun.


# Model Classes
This app's database includes three model classes: User, Project, Task

User - stores user attributes, including:
Name
Username
Email
Password (Secured with Bcrypt hashing algorithm)

Project:
User_id, to associate it with a user
project_name, a general name for the project

Task - stores tasks attributes, including:
 task_name,   naming the task
 description, giving more details to the task
 project_id,  to associate it with a project
 start_date,  date to start the project
 end_date,    estimated date of completion
 completed,   a boolean field to indicate when completed

Contributing
Bug reports and pull requests are welcome on GitHub.


License
The app is available as open source under the terms of the MIT License.
