require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  register Sinatra::Flash

  enable :sessions

  get '/' do
    'Hello Chitter!' #this should be where cheeps are posted
    #don't need to be logged in to see this page.
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
     @user = User.create(name: params[:name],
                        user_name: params[:user_name],
                        email: params[:email],
                        password: params[:password],
                        password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      flash.now[:notice] = "New user created"
      redirect '/cheeps'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
      #redirect '/users/new'
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:user_name], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/cheeps')
    else
      flash.now[:errors] = ['Your password and user name did not match']
      erb :'sessions/new'
    end
  end

  get '/sessions/sign_out' do
    flash[:notice] = "Auf Wiedersehen, goodbye #{current_user.user_name}"
    session[:user_id] = nil
    redirect '/cheeps'
  end

  get '/cheeps' do 
    @cheeps = Cheep.all
    erb :'cheeps/home'
  end

  post '/cheeps' do
    user = current_user
    @cheep = user.cheeps.create(body: params[:body],
     created_at: Time.now, posted_by: user.user_name)
    #(content: params[:content], time: params[:time],
                          #date: params[:date])
    #current_user.cheeps << cheep
    redirect '/cheeps'
  end

  get '/cheeps/new' do
    erb :'cheeps/new'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
