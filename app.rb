require 'sinatra/base'
require './lib/peeps.rb'
require './database_connection_setup.rb'

class Chitter < Sinatra::Base

  get '/' do
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
    User.add(email: params[:email], password: params[:password], 
      username: params[:username], name: params[:name])
    redirect('/')
  end

end
