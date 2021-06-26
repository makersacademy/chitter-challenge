require 'sinatra/base'
require 'sinatra/reloader'
require './lib/chitter'
require './lib/tweet'

class ChitterChat < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions, :method_override

  get '/' do
    $chitter = Chitter.new
    @chitter = $chitter
    erb :index
  end

  get '/tweets' do
    @chitter = $chitter
    @chitter.add(Tweet.new(params[:tweet]))
    erb :index
  end

  post '/index' do
    @chitter = $chitter
    erb :index
  end

  run! if app_file == $0
end