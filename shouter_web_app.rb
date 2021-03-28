require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require './lib/shouter.rb'
require './lib/users.rb'
Shouter.setup
Users.setup

class ShouterWebApp < Sinatra::Base
  enable :sessions, :method_override

  register Sinatra::Flash

  configure :development do
    register Sinatra::Reloader # this is from the Sinatra contrib gem
  end

  get '/' do
    session[:login] ||= [false, nil]
    @login = session[:login]
    @shouter = Shouter.all
    erb :index
  end

  post '/shout/new' do
    author = session[:login][1] unless session[:login][1] == nil
    Shouter.shout(params[:shout_box], author)
    redirect '/'
  end

  get '/sign_up' do
    erb :signup
  end

  post '/sign_up/new' do
    if Users.duplicate_email?(params[:email])
      flash[:unique_email] = "This email is already taken please login with your existing credentials or use a different email."
      redirect back
    end
    if Users.duplicate_username?(params[:username])
      flash[:unique_username] = "This username is already taken, please choose another username."
      redirect back
    end
    Users.signup(params[:name], params[:username], params[:email], params[:password])
    session[:login] = [true, params[:username]]
    redirect  '/'
  end

  post '/sign_out' do
    session[:login] = [false, nil]
    redirect '/'
  end

  get '/login' do
    erb :login
  end

  post '/login' do
    if Users.incorrect_login?(params[:username], params[:password])
      flash[:wrong_credentials] = "Your username or password is incorrect, please try again."
      redirect back
    end
    session[:login] = [true, params[:username]]
    redirect '/'
  end

  run! if app_file == $0
end
