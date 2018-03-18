require './database_connection_setup'
require './lib/peep'
require 'sinatra/base'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    session[:username] = 'anonymous'
    redirect '/chitter'
  end

  get '/chitter' do
    @welcome_msg = "Welcome, #{session[:username]}!"
    @peeps = Peep.all
    erb :'chitter/index'
  end

  post '/chitter/add_peep' do
    Peep.add(params[:new_peep_text], session[:username])
    redirect '/chitter'
  end

  post '/chitter/sign_up' do
    erb :'chitter/sign_up'
  end

  post '/chitter/apply_signup' do
    session[:username] = params[:username]
    redirect '/chitter'
  end

  run! if app_file == $0

end
