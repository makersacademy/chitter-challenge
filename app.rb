require 'sinatra/base'
require_relative 'load_database'

class ChitterApp < Sinatra::Base

  # not_found do
  #   status 404
  #   erb :'404Page'
  # end

  get '/' do
    "Hello, Chitter!"
    erb :index
  end

  get '/users/new' do
    erb :new_user
  end

  run! if app_file == $0
end
