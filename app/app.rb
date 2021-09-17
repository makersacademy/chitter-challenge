require 'sinatra/base'
require 'sinatra/reloader'
require_relative '../lib/chitter.rb'

class ChitterApp < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @messages = Chitter.show_all_messages
    erb :index
  end

  run! if app_file == $0
end
