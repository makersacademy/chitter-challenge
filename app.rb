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

  run! if app_file == $0
end
