require 'sinatra/base'
require 'sinatra/reloader'
# require_relative 'lib/player'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/peeps/new' do
    erb :index
  end
  
  # get '/newpeep' do
  #   erb :message
  # end

  post '/peeps' do
    @message = params[:message]
    @user = params[:user]
    erb :message
  end

  get '/peeps' do
    @peeps = Peeps.all
    erb :message
  end

 # start the server if ruby file executed directly
 run! if app_file == $0
end