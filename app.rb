require 'sinatra'
require 'sinatra/reloader'
require 'pg'
require './lib/peep'

class Chitter < Sinatra::Base
	configure :development do 
		register Sinatra::Reloader
	end

  enable :sessions

  set :port, 4566
  get '/' do
    erb :index
  end

  get '/peep' do
    erb :peep
  end
  
  post '/home' do
    session[:enter_peep] = params[:enter_peep]
    connection = PG.connect(dbname: "chitter")
    connection.exec("INSERT INTO peeps (texts) VALUES ('#{session[:enter_peep]}');")
    @peeps = Peep.all
    erb :home
  end

  run! if app_file == $0
end