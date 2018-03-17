require './database_connection_setup'
require './lib/peep'
require 'sinatra/base'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    session[:user_name] = nil
    redirect '/chitter'
  end

  get '/chitter' do
    @welcome_msg = session[:user_name]? "Welcome, #{session[:user_name]}!" : nil
    @peeps = Peep.all
    erb :'chitter/index'
  end

  post '/chitter/add_peep' do
    Peep.add(params[:new_peep_text])
    redirect '/chitter'
  end

  post '/chitter/sign_up' do
    erb :'chitter/sign_up'
  end

  post '/chitter/apply_signup' do
    session[:user_name] = params[:user_name]
    redirect '/chitter'
  end

  run! if app_file == $0

end
