require 'sinatra/base'
require 'sinatra/reloader'

class Chitter < Sinatra::Base 
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :chitter_homepage
  end

  run! if app_file == $0
end

  