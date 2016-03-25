ENV["RACK_ENV"] ||= "development"
require_relative 'models/user'
require 'sinatra/base'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  get '/' do
    erb(:peeps)
  end

  get '/users/new' do
    erb(:'users/new')
  end

  post '/users' do
    @user = User.create(
      email: params[:email],
      password: params[:password],
      name: params[:name],
      username: params[:username]
    )
    session[:user_id] = user.id 
    redirect('/')
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
