require 'sinatra/base'
require 'sinatra/flash'
require './app/data_mapper_setup'

class Chitter < Sinatra::Base
  run! if app_file == $PROGRAM_NAME
  register Sinatra::Flash

  set :views, proc { File.join(root, 'views') }

  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    erb :index
  end

  post '/user/sign-up' do
    #we initialize the object without saving it.
    @user = User.create(email: params[:email], password: params[:password],
    name: params[:name], username: params[:username])
    if @user.save #return true or false if successfuly saved
      session[:user_id] = @user.id
      redirect :'/user'
    else
      flash[:error] = ["The email or username are taken."]
      redirect '/'
    end
  end

  get '/user' do
    erb :'user/index'
  end

  helpers do
    def current_user
      User.get(session[:user_id])
    end
  end
end
