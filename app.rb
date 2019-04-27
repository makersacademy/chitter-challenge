require 'sinatra'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    @post = session[:message]
    erb :index
  end

  post '/new_post' do
    session[:message] = params[:message]
    redirect '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
