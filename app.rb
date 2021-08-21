require 'sinatra/base'
require 'sinatra/reloader'
# require_relative 'lib/player'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end
  
  # get '/newpeep' do
  #   erb :message
  # end

  post '/newpeep' do
    @message = params[:message]
    erb :message
  end


 # start the server if ruby file executed directly
 run! if app_file == $0
end