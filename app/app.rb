#require 'sinatra'
require 'sinatra/base'
require_relative 'models/message'

class Chitter < Sinatra::Base

  get '/' do
    @messages = Message.all.reverse
    erb :index
  end

  run! if app_file == $0

end
