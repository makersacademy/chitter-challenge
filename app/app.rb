require 'sinatra/base'
require 'sinatra/flash'
require './app/data_mapper_setup.rb'

class Chitter < Sinatra::Base

  enable :sessions, :static
  set :sessions_secret, 'v secret'
  set :public_folder, Proc.new { File.join(root, '..', 'public') }

  get '/' do
    @posts = Post.all
    erb :index
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(name: params[:name],
                username: params[:username],
                email: params[:email],
                password: params[:password],
                password_confirmation: params[:password_confirmation])
    session[:user_id] = user.id
    redirect to('/')
  end

  def current_user
    @current_user ||= User.get(session[:user_id]) 
  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME

end
