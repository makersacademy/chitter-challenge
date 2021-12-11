require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/reloader'
require './lib/message'
require './database_connection_setup'

class Chitter < Sinatra::Base 
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  post '/anonymous' do
    redirect '/home/anonymous'
  end

  get '/home/anonymous' do
    @peeps = Message.view_all
    # username to be added from users table
    erb :messages
  end

  post '/sign_in' do
    session[:username] = params[:username]
    redirect '/home'
  end

  post '/post_message' do
    Message.add(params[:message])
    redirect '/home'
  end

  get '/home' do
    if session[:username] == ""
      flash[:notice] = 'Please sign in with a username or as a guest'
      redirect '/'
    else
      @username = session[:username]
      @peeps = Message.view_all
      erb :messages
    end
  end

  run! if app_file == $0
end
