require 'sinatra/base'
require 'sinatra/flash'
require './lib/beet'
require './lib/user'

class Bitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/beets' do
    @beets = Beet.all
    @first_name = session[:first_name]
    erb(:beets)
  end

  get '/new_beet' do
    erb(:new_beet)
  end

  get '/users' do
    erb(:users)
  end

  get '/login' do
    erb(:login)
  end

  get '/logout' do
    session[:logged_in] = false
    flash[:logout] = "You have been logged out"
    redirect '/beets'
  end

  post '/login' do
    @user_credentials = User.authenticate(params[:email], params[:password])

    if @user_credentials
      session[:first_name] = @user_credentials[3]
      session[:user_id] = @user_credentials[0]
      session[:logged_in] = true
      flash[:logout] = nil
      redirect '/beets'
    elsif @user_credentials == nil
      flash[:authenticate_message] = "User not found, Please sign up!"
      redirect '/login'
    else
      flash[:authenticate_message] = "Email or Password incorrect"
      redirect '/login'
    end
  end

  post '/post_beet' do
    @text = params[:beet_text]
    Beet.add(@text)
    redirect '/beets'
  end

  post '/users/new' do
    @user = User.create(params[:first_name], params[:last_name], params[:email], params[:password])
    session[:first_name] = params[:first_name]
    session[:user_id] = @user.id
    redirect '/beets'
  end

  run! if app_file == $0
end