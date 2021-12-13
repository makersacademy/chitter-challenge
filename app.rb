require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/reloader'
require './lib/message'
require './lib/user'
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
    erb :messages
  end

  post '/sign_in' do
    session[:username] = params[:username]
    session[:password] = params[:password]
    redirect '/home'
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/details' do
    User.create(params[:name], params[:username], params[:email], params[:password])
    redirect '/success'
  end

  get '/success' do
    erb :success
  end

  post '/post_message' do
    uid = User.current_uid(session[:username])
    Message.add(params[:message], uid.to_i)
    redirect '/home'
  end

  get '/home' do
    if User.logged_in?(session[:username], session[:password])
      @peeps = Message.view_all
      erb :messages
    else
      flash[:notice] = 'Please sign in with a username & password or as a guest'
      redirect '/'
    end
  end

  run! if app_file == $0
end
