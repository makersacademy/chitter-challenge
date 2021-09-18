require 'sinatra/base'
require 'sinatra/reloader'
require_relative '../lib/chitter.rb'

class ChitterApp < Sinatra::Base

  set :public, 'public'

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

  run! if app_file == $0
end
