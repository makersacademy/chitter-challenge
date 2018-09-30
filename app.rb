require 'sinatra/base'
require './lib/chitter'

class ChitterApp < Sinatra::Base

get '/' do
  @messages = Message.show.reverse
  erb :index
end

post '/' do
  Message.add(params[:message])
  @messages = Message.show.reverse
  erb :index
end

run! if app_file == $PROGRAM_NAME
end
