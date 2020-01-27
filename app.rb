require 'sinatra/base'
require './lib/user'
require './database_connection_setup'
require './lib/peep'

class Chitter < Sinatra::Base
  enable :sessions 
 # look up session_secret

  get '/' do
    erb :landing
  end

  get '/sign-up' do
    erb :sign_up
  end

  post '/user-sign-up' do
    @user = User.create(params)
    session[:username] = params[:username]
    redirect '/log-in'
  end

  get '/peeps' do
    erb :peep_home, :locals => {
      user: session[:username], peep: peep.find_reversed
    }
  end

  post '/peep/new' do
    @peep = Peep.create(params)
    p @peep
    redirect '/peeps'
  end

  get '/log-in' do
    erb :log_in
  end

  post '/user-log-in'
    p user = User.find(params)
    session[:username] = user.username
    session[:id] = user.id 
    redirect '/peeps'
  end

  get '/user-sign-out' do
    session['username'] = nil
    redirect '/'
  end

end

