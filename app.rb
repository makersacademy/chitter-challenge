require 'sinatra/base'
require 'sinatra/flash'
require './lib/beet'
require './lib/user'
require './lib/helpers'

class Bitter < Sinatra::Base
  enable :sessions
  set :session_secret, "secret"
  register Sinatra::Flash

  get '/' do
    erb(:landing_page)
  end

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
    if session[:logged_in] != true
      session = nil
      erb(:login)
    else
      redirect '/beets'
    end
  end

  get '/logout' do
    session[:logged_in] = false
    session = nil
    flash[:logout] = "You have been logged out"
    redirect '/beets'
  end

  post '/login' do
    @user_credentials = User.authenticate(params[:email], params[:password])
    login(@user_credentials)
  end

  post '/post_beet' do
    @text = params[:beet_text]
    @user = session[:bitter_handle]
    Beet.add(@text, @user)
    redirect '/beets'
  end

  post '/users/new' do
    @user = User.create(params[:first_name], params[:last_name], params[:email], params[:password], params[:bitter_handle])
    new_user(@user)
  end

  run! if app_file == $0
end