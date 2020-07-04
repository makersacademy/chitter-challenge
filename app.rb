require 'sinatra/base'
require 'pg'
require './lib/user.rb'

class Chitter < Sinatra::Base

  get '/' do
   erb :index
  end

  post '/' do
    '/home' if User.check == true
    "Sorry"
  end

  get '/home' do
    erb :home
  end

  run! if app_file == $0
end