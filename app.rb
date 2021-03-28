require 'sinatra/base'
require 'sinatra/reloader'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb(:index)
  end

  get '/new' do
    erb(:new)
  end

  post '/' do
    redirect '/'
  end

  run if app_file == $0
end
