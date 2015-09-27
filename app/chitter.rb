require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  set :views, proc { File.join(root, 'views') }

  get '/' do
    erb :'home/index'
  end

  get '/users/new' do
    erb :'users/new', layout: false
  end

  post '/users' do
    user = User.create(name:                  params[:name],
                      email:                  params[:email],
                      password:               params[:password],
                      password_confirmation:  params[:password_confirmation])
    session[:user_id] = user.id
    redirect to ('/')
  end

  helpers do
    def current_user
      User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
