require './data_mapper_setup.rb'
require 'sinatra/base'
require 'tilt/erb'
require 'pry'
require 'rack-flash'

class Chitter < Sinatra::Base
  
  set :views, proc { File.join('app/views') }
  run! if app_file == $0

  set :sessions_secret, 'super secret'
  enable :sessions
  use Rack::Flash

  get '/' do
    @peeps = present_peeps
  
    erb :'index'
  end

  post '/' do
    create_peep params
    
    redirect to '/'
  end

  get '/register' do
    erb :'register'
  end

  post '/register' do
    @new_user  = create_user params
    redirect to '/'
  end

  post '/session' do
    user_authenticate params
  end

  helpers do
    def create_user params
      @new_user = User.new(
        :name                   => params[:name],
        :user_name              => params[:user_name],
        :email                  => params[:email],
        :password               => params[:password],
        :password_confirmation  => params[:password_confirmation]
      )
      if @new_user.save
        session[:user_id]  = @new_user.id
        flash[:notice] = "Welcome"
      else
        flash[:errors]= @new_user.errors.full_messages
      end

      @new_user
    end

    def present_peeps
      Peep.all(:limit => 15, :order => [:creation_time.desc])
    end

    def create_peep params
      peep = Peep.new(
              text:          params[:peep_text], 
              creation_time: time_creator,
              user_id:       current_user.id
            ) 
      if peep.save
        flash.now[:notice] = "Peep published"
      else
        flash.now[:errors]= peep.errors.full_messages

        redirect to '/'
      end

    end

    def time_creator
      Time.now
    end
    
    def current_user
      @user ||= User.get session[:user_id]
    end

    def user_authenticate params
      user = User.authenticate params

      if user
        session[:user_id]  = user.id
        redirect to '/'
      else
        flash.now[:errors] = 'The email or password is incorrect'

        erb :'index'
      end
    end

  end

end