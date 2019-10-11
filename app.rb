require 'sinatra/base'
require_relative 'lib/message'

class Chitter < Sinatra::Base

  get '/' do
    @message = Message.new
    erb :'index'
  end

  run! if app_file == $0

end
