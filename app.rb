require 'sinatra/base'
require_relative './lib/message_manager'
require_relative './lib/user'
require './database_connection_setup'

class ChitterApp < Sinatra::Base

  get '/chitter' do
    @chitter = Message_manager.show_peeps
    erb (:index)
  end

  post '/message' do
    Message_manager.post_peep(content: params[:content])
    redirect '/chitter'
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users/new' do
    User.create(name: params['name'], username: params['username'], email: params['email'], password: params['password'])
    redirect '/chitter'
  end

  run! if app_file == $0
end
