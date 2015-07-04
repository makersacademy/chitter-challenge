require 'sinatra/base'
require 'sinatra/flash'
require './app/data_mapper_setup.rb'

class Chitter < Sinatra::Base

  enable :sessions
  set :sessions_secret, 'super secret'
  register Sinatra::Flash
  
  get '/' do 
    'Chitter-Challenge'
    erb :'index'
  end

  get '/user/new' do
    erb :'user/new'
  end

  post '/users' do
    @user = User.create(name: params[:name],email: params[:email],username: params[:username],password: params[:password], password_confirmation: params[:password_confirmation])

    if @user.save  
      session[:user_id] = @user.id
      redirect to('/')
    else
      flash.now[:notice] = "The password and confirmation password are not correct"
      erb :'user/new'
    end
  end

  helpers do  
    def current_user
      user ||= User.first(id: session[:user_id]) #what does this line of code mean?
    end
  end



  # get '/main' do
  #   erb :'main'
  # end
 
  # start the server if ruby file executed directly
  run! if app_file == $0


 end
