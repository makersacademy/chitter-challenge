require 'sinatra/base'
require './lib/message'
class ChitterApp < Sinatra::Base
  get '/' do
    @messages = Message.all
    erb :index
  end



  run! if app_file == $0
end
