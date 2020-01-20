require 'sinatra/base'
require './lib/peep.rb'
require './lib/database_connection_setup'
require './lib/user'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    'Welcome to Chitter!'
    erb(:index)
  end

  post '/log_in' do
    session[:name] = params[:name]
    User.create(params[:email], params[:password])
    redirect '/peeps'
  end
  
  post '/peeps/new' do
    Peep.add(params[:peep])
    redirect '/peeps'
  end

  get '/peeps' do
    @user_name = session[:name]
    @peeps = Peep.all
    erb(:peeps)
  end

  run! if app_file == $0
end