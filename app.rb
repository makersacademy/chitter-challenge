require 'bcrypt'
require 'sinatra/base'
require 'sinatra/flash'
require './lib/chitterfeed.rb'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash


  get '/' do
    @feed = ChitterFeed.view
    @feed.reverse!
    erb :homepage
  end

  post '/find-user' do
    user = User.find_id(params[:email], params[:psw])
    if user == 'no such user'
      flash[:login_error] = 'Your username or password were incorrect, please try again'
      redirect ('/login')
    else session[:username] = user 
      redirect ('/')
    end
  end

  post '/post-message' do
    ChitterFeed.add(params[:content], session[:userid] = 1)
    redirect '/'
  end

  post '/sign-up' do
    User.add(params[:name], params[:username], params[:email], params[:psw])
    redirect '/login'
  end

  get '/register' do
    erb :register
  end

  get '/login' do
    erb :login
  end

  run! if app_file == $0

end