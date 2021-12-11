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
    user = User.create(email: params[:email], password: params[:password], username: params[:password])
    if user == 1
      flash[:notice] = 'Email already exists' 
    elsif user == 2
      flash[:notice] = 'Username already exists' 
    else
      session[:user_id] = user.id
    end
    redirect '/'
  end

end