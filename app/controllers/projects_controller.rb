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
    @project = Project.find_by(:id => params[:id])
    erb :"/projects/show"
  end

  # GET: /projects/5/edit
  get "/projects/:id/edit" do
    authorize_user
    @project = Project.find_by(:id => params[:id])
    if @project && @project.user.id = session[:user_id]
      erb :"/projects/edit"
    else
      redirect "/projects"
    end
  end

  # PATCH: /projects/5

  patch "/projects/:id" do
    authorize_user
    binding.pry
    @project = Project.find_by(:id => params[:id])
    if @project && @project.user.id = session[:user_id]

      @project.update(params["project"])
      # check if any tasks were added, similar to
    #   if !params["pet"]["name"].empty?
    #   @owner.pets << Pet.create(name: params["pet"]["name"])
    # end

    # redirect "/projects/:id"
    else
      redirect "/projects"
    end


  end

  # DELETE: /projects/5/delete
  delete "/projects/:id/delete" do
    redirect "/projects"
  end
end
