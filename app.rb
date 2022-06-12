require 'sinatra/base'
require 'sinatra/reloader'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Chitter'
  end

  get '/messages' do
    @messages = Chitter.all
    erb :'messages/index'
  end

  get '/messages/new' do
    erb :'messages/new'
  end

  post '/messages' do
    Chitter.create(message: params[:message], user_id: params[:user_id])
    redirect '/messages'
  end

  run! if app_file == $0
end


