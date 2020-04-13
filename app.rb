require 'sinatra/base'
require './lib/peeps.rb'
require './database_connection_setup.rb'
require './lib/user.rb'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    @user = User.find(session[:user_id])

    @messages = Peeps.all
    erb :index
  end

  post '/' do 
    peep = params[:peep]
    Peeps.add(peep)
    redirect('/')
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    user = User.create(email: params[:email], password: params[:password], 
      username: params[:username], name: params[:name])

    session[:user_id] = user.id

    redirect('/')
  end

end
