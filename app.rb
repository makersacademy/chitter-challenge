require 'sinatra/base'
require 'sinatra/flash'
require './lib/chitterfeed.rb'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  LOGIN_ERROR = 'Your username or password were incorrect, please try again'
  INCORRECT_PASSWORD = 'Incorrect password, please try again'

  get '/' do
    @feed = ChitterFeed.view
    @feed.reverse!
    erb :homepage
  end

  post '/find-user' do
    user = User.find_id(params[:email], params[:psw])
    if user == 'no such user'
      flash[:login_error] = LOGIN_ERROR
      redirect '/login'
    elsif user == 'incorrect password'
      flash[:incorrect_password] = INCORRECT_PASSWORD
      redirect '/login'
    else session[:username] = user 
      redirect '/'
    end
  end

  post '/post-message' do
    if session[:logged_in]
      ChitterFeed.add(params[:content], session[:userid])
    else
      ChitterFeed.add(params[:content])
    end
    redirect '/'
    end
    
  post '/sign-up' do
    User.add(params[:name], params[:username], params[:email], params[:psw])
    session[:userid] = User.session_id(params[:email])
    puts '********'
    puts session[:userid]
    puts '^^^^^^^^^'
    session[:username] = params[:username]
    session[:logged_in] = true
    redirect '/'
  end

  get '/register' do
    erb :register
  end

  get '/login' do
    erb :login
  end

  post '/logout' do
    session[:username] = nil
    session[:userid] = nil
    session[:logged_in] = false
    redirect '/'
  end

  run! if app_file == $0

end