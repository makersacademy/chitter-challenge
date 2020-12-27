require 'sinatra/base'
require './lib/chitter'

class Chitter_Main < Sinatra::Base

  get '/' do
    'Howdy'
    erb :index
  end


  get '/postboard' do
    @chitter = Chitter.all
    erb :postboard
  end

  post '/chitter_post' do
    # Chitter.create(post: params[:post], time: params[:time])
    Chitter.create(post: params[:post])
    redirect '/postboard'
  end

  run! if app_file == $0
end
