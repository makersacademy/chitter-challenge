require 'sinatra'
require 'sinatra/reloader'
require 'pg'
require './lib/peep'
require './database_connection_setup'

class Chitter < Sinatra::Base
	configure :development do 
		register Sinatra::Reloader
	end

  enable :sessions

  set :port, 9293
  get '/' do
    erb :index
  end

  get '/peep' do
    erb :peep
  end
  
  post '/home' do
    session[:enter_peep] = params[:enter_peep]
    Peep.create(session[:enter_peep])
    @peeps = Peep.all
    erb :home
  end

  run! if app_file == $0
end