require 'sinatra/base'
require './lib/chitter'

class ChitterApp < Sinatra::Base

get '/' do
  @messages = Message.show
  erb :index
end

post '/' do
  erb :index
end

run! if app_file == $PROGRAM_NAME
end
