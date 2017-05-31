ENV["RACK_ENV"] = "development"

require_relative 'models/link'
require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/' do
    erb :'links/index'
  end

  get '/signup' do
    erb :'links/register'
  end

  post '/profile' do
    $name = params[:name]

    redirect '/home'
  end

  get '/home' do
    erb :'links/home'
  end
end
