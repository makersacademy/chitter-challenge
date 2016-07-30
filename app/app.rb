ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'

require_relative 'models/user'

class Chitter < Sinatra::Base
  get '/' do
    "Hello world"
  end

  get '/users/new' do
    erb(:new)
  end
end
