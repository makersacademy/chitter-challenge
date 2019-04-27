require 'sinatra'

class Chitter < Sinatra::Application

  enable :sessions 

  get '/' do
    'Welcome to Chitter!'
  end

  post '/message' do
  p  session[:message] = params[:message]
    redirect '/message'
  end

  get '/message' do
   p @message = session[:message]
    erb :index
  end


  run! if app_file == $0
end