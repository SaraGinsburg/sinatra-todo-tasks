require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV['SESSION_SECRET']
    register Sinatra::Flash
  end

  get "/" do
    redirect '/login'
  end


  helpers do
    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def authorize_user
      redirect '/login' unless logged_in?
    end

    def redirect_unless_authorized
      @project = Project.find_by(id: params[:id].to_i)
      if @project.user.id != session[:user_id]
        flash[:message] = "A user must be logged in,
         and can modify or delete only his own projects"
        redirect '/projects'
      end
    end
  end

end
