ENV['RACK_ENV'] = 'development'
require 'sinatra/base'

class Chitter < Sinatra::Base
  enable :sessions

  get '/chat' do
    
    erb :chat
  end

  post '/chat' do
    session[:message] = params[:message]
    redirect '/chat'
  end

  run! if app_file == $0
end
