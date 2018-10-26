require 'sinatra/base'
require_relative 'lib/message'

class Chitter < Sinatra::Base

  get '/' do
    @messages = Message.all
    erb :index
  end


  run! if app_file == $0

end
