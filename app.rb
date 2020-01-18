require 'sinatra/base'
require './lib/database_connection_setup'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    'Welcome to Chitter!'
    erb(:index)
  end
  
  post '/peeps/new' do
    session[:peep] = params[:peep]
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = session[:peep]
    erb(:peeps)
  end

  run! if app_file == $0
end