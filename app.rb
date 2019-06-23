require 'sinatra/base'
require './lib/models/message.rb'
require './lib/models/user.rb'

class Chitter < Sinatra::Base
  enable :sessions

  get '/chitter' do
    @messages = Message.all
    @user = User.all
    @user_id = session[:id]
    erb :index
  end

  get '/user_sign_in' do
    erb :sign_in
  end

  post '/user_data' do
    user = User.create(email: params[:email], password: params[:password], name: params[:name], user_name: params[:user_name])
    session[:id] = user.id
    redirect '/chitter'
  end

  post '/post_peep' do
    Message.create(text: params[:peep]) #, user_id: params[:id])
    redirect '/chitter'
  end

  run! if app_file == $0
end
