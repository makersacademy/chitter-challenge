ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_set_up'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  
  get '/' do
    @chits = Chit.all
    erb(:index)
  end

  get '/add' do
    erb(:add)
  end

  post '/' do
    Chit.create(words: params[:chit])
    redirect '/'
  end

  get '/users/new' do
    erb(:'users/new')
  end

  post '/users' do
    user = User.create(email: params[:email], password: params[:password])
    session[:user_id] =user.id
    redirect to('/')
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $0
end
