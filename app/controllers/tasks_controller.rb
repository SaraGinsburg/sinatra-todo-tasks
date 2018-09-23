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
    @projects = @user.projects

    erb :"/tasks/new"

  end

  post '/register' do
    redirect to "/projects/#{params[:selected]}/edit"
  end


  # GET: /tasks/5
  get "/tasks/:id" do
    authorize_user
    @task = Task.find_by(:id => params[:id])
    if @task && @task.project.user.id == session[:user_id]
      erb :"/tasks/show"
    else
      flash[:message] = "A user can view only his own tasks"
      redirect "/projects"
    end
  end

  # GET: /tasks/5/edit
  get "/tasks/:id/edit" do
    authorize_user
    @task = Task.find_by(:id => params[:id])
    if @task && @task.project.user.id == session[:user_id]
      erb :"/tasks/edit"
    else
      flash[:message] = "A user can modify only his own tasks"
      redirect "/tasks"
    end
  end

  # PATCH: /tasks/5
  patch "/tasks/:id" do
    authorize_user
    @task = Task.find_by(:id => params[:id].to_i)
    if @task && @task.project.user.id == session[:user_id]
      @task.update(:description => params[:description],:start_date => params[:start_date],:end_date => params[:end_date], :completed => params[:completed] )
    else
      flash[:message] = "Only a logged in user can modify a project"
    end
    redirect "/projects/#{@task.project_id}/edit"
  end

  # DELETE: /tasks/5/delete
  delete "/tasks/:id" do

    @task = Task.find_by(id: params[:id].to_i)
    if @task.project.user.id == session[:user_id] && @task.destroy
      flash[:message] = "#{@task.task_name} successfully deleted."
      redirect "/projects/#{@task.project_id}/edit"
    else
      flash[:message] = "You don't have the authority to delete #{@task.task_name}."
    end

    redirect "/projects"
  end


end
