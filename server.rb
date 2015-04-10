require 'sinatra'

class Chitter < Sinatra::Application

  get '/' do
    erb :index
  end

  post '/signup' do
    "welcome #{params['email']}"
  end

end
