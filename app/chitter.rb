require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  set :views, proc { File.join(root, 'views') }

  register Sinatra::Flash


  get '/' do
    erb :'home/index'
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new', layout: false
  end

  post '/users' do
    @user = User.create(name:                   params[:name],
                        email:                  params[:email],
                        password:               params[:password],
                        password_confirmation:  params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to ('/')
    else
      flash.now[:notice] = "Password and confirmation password do not match"
      erb :'users/new'
    end
  end

  helpers do
    def current_user
      User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
