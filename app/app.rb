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
    # @user_1_post = params[:user_1_post]
    Chitter.create(post: params[:post], time: params[:time])
    redirect '/postboard'
  end

  run! if app_file == $0
end
