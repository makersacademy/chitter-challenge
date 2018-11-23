require 'sinatra/base'
require_relative './lib/message_manager'
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

  run! if app_file == $0
end
