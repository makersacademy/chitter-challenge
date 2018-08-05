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

get '/peeps' do 
  @peeps = Peep.all  
  erb :peeps
end 

run! if app_file == $PROGRAM_NAME
end
