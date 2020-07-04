require 'sinatra/base'
require 'pg'

class Chitter < Sinatra::Base

  get '/' do
   erb :index
  end

  get '/home' do
    erb :home
  end

  run! if app_file == $0
end