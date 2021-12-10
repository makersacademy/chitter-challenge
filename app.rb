require 'sinatra/base'
require 'sinatra/reloader'

class Chitter < Sinatra::Base 
  enable :sessions

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  post '/post_message' do
    session[:message] = params[:message]
    redirect '/home'
  end

  get '/home' do
    @message = session[:message]
    erb :messages
  end

  run! if app_file == $0
end
