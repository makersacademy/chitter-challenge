require 'sinatra/base'
require 'sinatra/reloader'
require 'pg'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Hello World'
  end

  get '/chitter' do 
  end 

  run! if app_file == $0
end