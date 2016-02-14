ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './dm_setup'

class Chitter < Sinatra::Base
  get '/signup' do
    erb(:signup)
  end

  post '/signup' do
    User.create(username: params[:username], password: params[:password])
    redirect('/')
  end

  get '/' do
    'Lorem &c.'
  end

  run! if app_file == $0
end