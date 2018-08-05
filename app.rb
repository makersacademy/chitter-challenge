require 'sinatra/base'
require 'sinatra/flash'
require './lib/peep' 
require 'uri'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  post '/username' do 
    session[:username] = params[:username]
    redirect('/peeps')
  end

  post '/user_peep' do 
    session[:user_peep] = params[:user_peep]
    Peep.create(session[:username], session[:user_peep]) # need to take out of control 
    redirect '/peeps'
  end 

  get '/peeps' do 
    @peeps = Peep.all  
    erb :peeps
  end 

  run! if app_file == $PROGRAM_NAME
end
