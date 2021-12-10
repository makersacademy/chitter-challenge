require 'sinatra'
require 'sinatra/reloader'


class Chitter < Sinatra::Base

  configure :development do 
    register Sinatra::Reloader
  end

  get '/' do 
    erb :index
  end

  post '/peep' do
    params
  end
end
