require 'sinatra/base'
require './lib/peep'
require './lib/user'
require './database_connection_setup'
require './lib/database_connection'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    @peeps = Peep.all
    @email = session[:email]
    erb(:index)
  end

  post '/peeps/new' do
    Peep.create(description: params[:peep]).first
    redirect '/'
  end

  get '/login' do 
    erb(:login)
  end

  get '/signup' do
    erb(:signup)
  end

  post '/signup' do
    @user = User.create(params)
    session[:id] = @user.id
    session[:email] = @user.email
    redirect('/')
  end

end
