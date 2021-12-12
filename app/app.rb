require 'pg'
require 'sinatra'
require 'sinatra/contrib'
require 'sinatra/flash'
require_relative '../database_connection_setup.rb'
require_relative '../lib/peep.rb'
require_relative '../lib/user.rb'

class ChitterApp < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @user = User.find(id: session[:user_id])
    @chitters = Peep.all
    erb(:index)
  end

  post '/message/new' do
    Peep.create(params[:message])
    redirect '/'
  end

  get '/users/new' do
    erb(:"users/new")
  end

  post '/users' do
    user = User.create(email: params[:email], password: params[:password])
    if user == 1
      flash[:notice] = 'Email already exists'
    else
      session[:user_id] = user.id
    end
    redirect '/'
  end

  get '/sessions/new' do
    erb(:"sessions/new")
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])
    if user != nil
      session[:user_id] = user.id
      redirect '/'
    else
      flash[:notice] = 'Please check email or password.' 
      redirect '/sessions/new'
    end
    redirect('/peeps')
  end

end