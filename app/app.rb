require 'sinatra/base'
require 'sinatra/reloader'
require_relative '../lib/chitter.rb'
require_relative '../db/queries/pg_connect.rb'

class ChitterApp < Sinatra::Base

  set :public_folder, 'public'

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    
    erb :index
  end

  get '/home' do
    @messages = Chitter.show_all_messages
    erb :messages
  end

  post '/add-message' do
    p params
    redirect '/home'
  end

  run! if app_file == $0
end
