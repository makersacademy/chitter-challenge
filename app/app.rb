require "sinatra/base"
require "sinatra/flash"
require_relative "models/peep"
require_relative "models/user"
require_relative "models/data_mapper_setup"

data_mapper_configure

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :index
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.new(email: params[:email],
                username: params[:username],
                name: params[:name],
                password: params[:password],
                password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/peeps'
    else
      flash.now[:notice] = "The two passwords provided do not match"
      erb :'users/new'
    end
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
