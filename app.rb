require 'sinatra/base'
require_relative './lib/message_manager'
require_relative './lib/user'
require './database_connection_setup'

class ChitterApp < Sinatra::Base
  enable :sessions

  get '/chitter' do
    @user = User.find(id: session[:user_id])
    @chitter = Message.show_peeps
    erb(:index)
  end

  post '/message' do
    Message.post_peep(content: params[:content])
    redirect '/chitter'
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users/new' do
    user = User.create(name: params['name'], username: params['username'], \
      email: params['email'], password: params['password'])
    session[:user_id] = user.id
    redirect '/chitter'
  end

  run! if app_file == $0
end
