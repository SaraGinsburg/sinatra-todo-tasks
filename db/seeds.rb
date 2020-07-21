

# create_table "tasks", id: :serial, force: :cascade do |t|
#   t.string "task_name"
#   t.string "description"
#   t.integer "project_id"
#   t.date "start_date"
#   t.date "end_date"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.boolean "completed"
# end
#


# Create Users
  @user1 = User.create(name: "Sara", username: "sara", email:"sara@gmail.com", password: "password")
  @user2 = User.create(name: "Liba", username: "liba", email:"liba@gmail.com", password: "password")
  @user3 = User.create(name: "Moishe", username: "moishe", email:"moishe@gmail.com", password: "password")
  @user4 = User.create(name: "Levi", username: "levi", email:"levi@gmail.com", password: "password")
  @user5 = User.create(name: "Dovid", username: "dovid", email:"dovid@gmail.com", password: "password")
  @user6 = User.create(name: "Yaakov", username: "yaakov", email:"yaakov@gmail.com", password: "password")

# Create Projects
  @project1 = @user1.projects.create(project_name: "renovate kitchen")
  @project2 = @user1.projects.create(project_name: "window shades")
  @project3 = @user1.projects.create(project_name: "plan trip to Europe")
  @project4 = @user1.projects.create(project_name: "build portfolio")

  @project5 = @user2.projects.create(project_name: "finish degree")
  @project6 = @user2.projects.create(project_name: "paint apartment")

# Create Tasks
  @task1 = @project1.tasks.create(task_name: "get estimates for new counter", description: "call Home Depot and private contractor")
  @task2 = @project1.tasks.create(task_name: "new oven", description: "check Home Depot and others")
  @task3 = @project1.tasks.create(task_name: "replace chairs", description: "wayfair or overstock")
  @task4 = @project1.tasks.create(task_name: "service refrigerator", description: "call company")
  @task5 = @project1.tasks.create(task_name: "sinks", description: "get grids and replace sinks")
  @task6 = @project2.tasks.create(task_name: "buy drill", description: "online or at local hardware")
  @task7 = @project2.tasks.create(task_name: "hang shades", description: "3 window trimmings in BR")
  @task8 = @project4.tasks.create(task_name: "cli", description: "consult graduates on slack")
  @task9 = @project4.tasks.create(task_name: "sinatra", description: "finish up")
  @task10 = @project4.tasks.create(task_name: "our family - deploy", description: "go through all steps")
