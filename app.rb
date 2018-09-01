require 'sinatra/base'
require './lib/peep.rb'
require './lib/user.rb'
require './lib/database_connection'
require './database_connection_setup'

class Chitter < Sinatra::Base

  enable :sessions, :method_override # allows us to use patch, delete etc

  get '/' do
    if session[:username] == nil
      redirect '/signup'
    else
      @peeps = Peep.all
      erb(:index)
    end
  end

  post '/peep' do
    Peep.create(params[:peep])
    redirect '/'
  end

  get '/signup' do
    erb(:signup)
  end

  post '/signup' do
    session[:username] = User.signup(params)
    redirect '/'
  end

  run! if app_file == $0
end
