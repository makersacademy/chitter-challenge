require 'sinatra/base'
require 'data_mapper'
require_relative 'models/user'
require_relative 'data_mapper_setup'

class ChitterChatter < Sinatra::Base

  enable :sessions
  set :session_secret, "verysecret"

set :views, Proc.new {File.join(root, "views")}

  get '/' do
    @name = session[:name]
    erb :index
  end

  get '/users/new' do
    erb :newuser
  end

  post '/users' do
    @user = User.create(email: params[:email],
                      name: params[:name],
                      username: params[:username],
                      password: params[:password] )
    @user.save
    session[:name] = @user.username
    redirect to('/')
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
