require "sinatra/base"
require_relative "models/peep"
require_relative "models/user"
require_relative "models/data_mapper_setup"

data_mapper_configure

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

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
    erb :'users/new'
  end

  post '/users' do
    user = User.create(email: params[:email],
                username: params[:username],
                name: params[:name],
                password: params[:password])
    session[:user_id] = user.id
    redirect '/peeps'
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
