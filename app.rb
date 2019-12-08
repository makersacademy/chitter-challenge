require 'sinatra/base'
require './lib/chitter'

class ChitterManager < Sinatra::Base
  get '/' do
    erb :'chitter/index'
  end

  get '/chitter' do
    @chitter = Chitter.all
    erb :'chitter/posts'
  end

  get '/chitter/new' do
    erb :'chitter/new'
  end

  post '/chitter' do
    Chitter.create(message: params['message'])
    redirect '/chitter'
  end

  run! if app_file == $0
end
