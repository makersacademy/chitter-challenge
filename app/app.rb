require 'sinatra/base'
require './lib/chitter'

class Chitter_Main < Sinatra::Base

  get '/' do
    'Howdy'
    erb :index
  end


  post '/create_user' do
    @email_1 = params[:email]
    @password_1 = params[:password]
    @name_1 = params[:name]
    @user_1 = params[:username]
    # redirect '/logged_in'
    erb :logged_in
  end

  get '/logged_in' do
    erb :logged_in
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
