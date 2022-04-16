require 'sinatra/base'
require 'sinatra/reloader'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Hello world'
  end

  get '/chitter/peeps/new' do
    erb :'posts/new'
  end
  run! if app_file == $0
end
