require 'sinatra/base'
require 'sinatra/partial'
require 'data_mapper'

require_relative 'server'

class Chitter < Sinatra::Base
  get '/' do
    redirect '/users/new'
  end

  get '/users/new' do
    erb :'users/new'
  end
end
