class ProjectsController < ApplicationController

  # GET: /projects
  get "/projects" do
    authorize_user
    @projects = Project.all
    erb :"/projects/index"
  end

  # GET: /projects/new
  get "/projects/new" do
    authorize_user
    @user = User.find_by(:id => session[:user_id])
    erb :"/projects/new"
  end

  # POST: /projects
  post "/projects" do
    Project.create(:user_id => session[:user_id], :project_name => params[:project_name])
    redirect "/projects"
  end

  # GET: /projects/5
  get "/projects/:id" do
    authorize_user
    @project = Project.find_by(:id => params[:id].to_i)
    erb :"/projects/show"
  end

  # GET: /projects/5/edit
  get "/projects/:id/edit" do
    authorize_user
    @project = Project.find_by(:id => params[:id])

    if @project && @project.user.id == session[:user_id]
      erb :"/projects/edit"
    else
      flash[:message] = "Only a logged in user can modify a project"
      redirect "/projects"
    end
  end

  # PATCH: /projects/5

  patch "/projects/:id" do
    authorize_user
    @project = Project.find_by(:id => params[:id].to_i)
    if @project && @project.user.id == session[:user_id]

      @project.update(:project_name => params[:project_name]) unless params[:project_name].nil?

      if !params[:task_name].empty?
        @project.tasks << Task.create(task_name: params[:task_name],
        description: params[:description], start_date: params[:start_date],
        end_date: params[:end_date])
        erb :"/projects/edit"
      else
        @project = Project.find_by(:id => params[:id].to_i)
        erb :"/projects/show"
      end
    else
      flash[:message] = "Only a logged in user can modify a project"
      redirect "/projects"
    end

  end

  # DELETE: /projects/5/delete
# TODO build the delete option
  delete "/projects/:id/delete" do
    redirect "/projects"
  end
end
