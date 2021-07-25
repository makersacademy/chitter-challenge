require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/reloader'
require 'pg'
require './lib/peep'
require './lib/user'
require './database_connection_setup'

class ChitterChallenge < Sinatra::Base
  enable :sessions

  register Sinatra::Flash

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb(:index)
  end
  
  get '/peeps' do
    @peeps = Peep.all
    erb(:"peeps/index")
  end
  
  get '/peeps/new' do
    unless session[:user]
      flash[:notice] = 'You must be logged in before you can post a peep.'
      redirect '/users/login'
    end
    
    erb(:"peeps/new")
  end
  
  post '/peeps' do
    Peep.create(text: params[:peep], user_id: session[:user].id)
    redirect '/peeps'
  end

  get '/users/new' do
    erb(:"users/new")
  end

  post '/users' do
    if User.username_exists?(params[:username])
      flash[:notice] = 'That username is already taken.'
      redirect '/users/new'
    elsif User.email_exists?(params[:email])
      flash[:notice] = 'There is already an account with the email address.'
      redirect '/users/new'
    end
    session[:user] = User.create(
      name: params[:name],
      username: params[:username],
      email: params[:email],
      password: params[:password]
    )
    flash[:notice] = "Signed in as #{session[:user].name}" if session[:user]
    redirect '/'
  end

  get '/users/login' do
    erb(:"users/login")
  end

  post '/users/login' do
    unless (session[:user] = User.login(username: params[:username], password: params[:password]))
      flash[:notice] = "The username and password do not match."
      redirect '/users/login'
    end
    flash[:notice] = "Logged in as #{session[:user].name}"
    redirect '/'
  end

  run! if app_file == $0
end
