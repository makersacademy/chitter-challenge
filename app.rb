require 'sinatra/base'
require 'sinatra/flash'
require './models/peep.rb'

class Chitter < Sinatra::Base

  register Sinatra::Flash
  enable :sessions

  get '/' do
    erb :index
  end

  post '/username' do
    session[:username] = params[:username]
    redirect '/peeps'
  end

  get '/peeps' do
    erb :peeps
  end

  post '/peep' do
    Peep.add(session[:username], params[:peep_text])
    redirect '/peeps'
  end

  run! if app_file == $0

end
