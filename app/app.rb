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

  post '/users' do
    User.create(email: params[:email], password: params[:password])
    'Welcome to Chitter!'
  end
end
