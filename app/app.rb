require 'sinatra/base'
require 'sinatra/flash'
require_relative 'models/user'

class Chitter < Sinatra::Base

  get '/users/new' do
    erb :'users/new'
  end


end
