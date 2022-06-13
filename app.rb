require 'sinatra/base'
require 'sinatra/reloader'
require './lib/chitter'

class Chittermanager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/chitter' do
    @user_input = Chitter.all
    erb :'chitter/index'
  end

  post '/chitter' do 
    Chitter.create(chat_log: params[:chat_log])
  redirect '/chitter'

  end

  run! if app_file == $0
end
