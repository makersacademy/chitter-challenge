require 'sinatra'
require 'sinatra/reloader'

class Chitter < Sinatra::Base
	configure :development do 
		register Sinatra::Reloader
	end

  enable :sessions

  get '/' do
    erb :index
  end

  get '/peep' do
    erb :peep
  end
  
  post '/home' do
    sessions = params[:enter_peep]
  end


  run! if app_file == $0
end