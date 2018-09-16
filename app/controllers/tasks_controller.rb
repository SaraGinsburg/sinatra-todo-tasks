class TasksController < ApplicationController

  # GET: /tasks
  get "/tasks" do
    authorize_user
    @user = User.find_by(:id => session[:user_id])
    @projects = @user.projects
    @tasks = Task.all
    erb :"/tasks/index"
  end

  # GET: /tasks/new
  get "/tasks/new" do
    authorize_user
    @user = User.find_by(:id => session[:user_id])
    # TODO allow a check box to choose for which project is this task created
    erb :"/tasks/new"
  end

  # POST: /tasks
  post "/tasks" do
    # TODO Task.create ....
    redirect "/tasks"
  end

  # GET: /tasks/5
  get "/tasks/:id" do
    authorize_user
    # TODO @task = Task.find_by.....
    erb :"/tasks/show"
  end

  # GET: /tasks/5/edit
  get "/tasks/:id/edit" do
    erb :"/tasks/edit"
  end

  # PATCH: /tasks/5
  patch "/tasks/:id" do
    redirect "/tasks/:id"
  end

  # DELETE: /tasks/5/delete
  delete "/tasks/:id/delete" do
    # TODO build the delete option
    redirect "/tasks"
  end
end
