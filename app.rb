require 'sinatra/base'
require 'sinatra/reloader'

class ChitterChat < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions, :method_override

  get '/' do
    erb :index
  end

  post '/index' do
    @tweet = params[:tweet]
    erb :index
  end

  run! if app_file == $0
end