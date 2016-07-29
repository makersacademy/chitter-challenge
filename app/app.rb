ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'

require_relative 'models/user'

class Chitter < Sinatra::Base
  get '/users' do
    erb :'users/new'
  end
end
