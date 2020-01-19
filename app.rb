require 'sinatra/base'
require './lib/peep.rb'
require './lib/database_connection_setup'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    p ENV['RACK_ENV']
    'Welcome to Chitter!'
    erb(:index)
  end

  post '/log_in' do
    session[:name] = params[:name]
    redirect '/peeps'
  end
  
  post '/peeps/new' do
    session[:peep] = params[:peep]
    Peep.add(session[:peep])
    redirect '/peeps'
  end

  get '/peeps' do
    @user_name = session[:name]
    @peeps = Peep.all
    erb(:peeps)
  end

  run! if app_file == $0
end