require 'sinatra/base'
require_relative 'models/user'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  post '/' do
    @message = params[:message]
    User = User.new(@message) #name, email
    erb :index
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
