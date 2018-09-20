class UsersController < ApplicationController


  get '/signup' do
    if !logged_in?
      erb :'users/signup'
    else
      flash[:message] = "you are already signed up"
      @users = User.all
      erb :"/users/index"
    end
  end

  get '/login' do
    if logged_in?
      flash[:message] = "You are already logged in as #{@current_user.name}"
      @user = @current_user
      erb :'/users/show'
    else
      erb :'users/login'
    end
  end

  post '/signup' do
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      redirect to "/signup"
    else
      if !!User.find_by(username: params[:username]) || !!User.find_by(email: params[:email])
        flash[:message] = "this user already exists"
        redirect to "/login"
      else
        @user = User.create(:name => params[:name], :username => params[:username], :email => params[:email] ,:password => params[:password])
        session[:user_id] = @user.id
        flash[:message] = "you are signed up and logged in"
        redirect to "/users"
      end
    end
  end

  post '/login' do
    if  logged_in?
      redirect to "/login"
    else

      @user = User.find_by(:username => params[:username])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        @projects = @user.projects
        erb  :"/projects/index"
      else
        flash[:message] = "login failed. please sign up"
        redirect "/signup"
      end
    end
  end

  get '/logout' do
    session.clear
    redirect "/"
  end

  get "/users" do
    @users = User.all
    erb :"/users/index"
  end


  get "/users/:id" do
    @user = User.find_by(id: params[:id])

    if @user && session[:user_id] == params[:id].to_i
      erb :'/users/show'
    else
      redirect '/'
    end
  end

  get "/users/:id/edit" do
      @user = User.find_by(id: params[:id])
      if @user && session[:user_id] == params[:id].to_i
        erb :'/users/edit'
      else
        flash[:message] = "You are attempting to modify a user different than yourself. This is not allowed!"
        session.clear
        redirect '/login'
      end
    end

    patch "/users/:id" do

      @user = User.find_by(:id => params[:id])
      if @user && @user == current_user
        @user.update(:name => params[:name], :username => params[:username],:email => params[:email])
        redirect "/users/#{params[:id]}"
      else
        session.clear
        redirect '/login'
      end
    end

end
