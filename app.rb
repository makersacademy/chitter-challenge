require 'sinatra/base'
require_relative './lib/chitter'
require './database_connection_setup'

class ChitterApp < Sinatra::Base
  get '/chitter' do
    erb (:index)
  end

  post '/message' do
  Chitter.post_peep(content: params[:content])
  redirect '/chitter'
end

  run! if app_file == $0
end
