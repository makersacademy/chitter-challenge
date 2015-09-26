require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'sinatra/flash'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  # register Sinatra::Flash
  # use Rack::MethodOverride needed for delete
  # set :views, proc { File.join(root, '..', 'views') }

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id]) if session[:user_id]
    end
  end

  get '/' do
    erb :index
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(email: params[:email],
                  password:   params[:password],
                  name:       params[:name],
                  username:   params[:username])
    session[:user_id] = user.id
    redirect '/'
  end

end
