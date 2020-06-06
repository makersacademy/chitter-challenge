require_relative 'database_connection_setup'
require 'sinatra'
require 'sinatra/flash'
require_relative './lib/user'
require_relative './lib/chitter'

class ChitterWebApp < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb(:login)
  end

  post '/feed' do
    if User.find_user(params[:username]) == false
      flash[:username] = 'username does not exist'
      redirect '/'
    elsif User.login_correct?(params[:password]) == false
       flash[:password] = 'incorrect password'
       redirect '/'
    else
      redirect '/feed'
    end
  end

  get '/feed' do
    @user = User.current_user
    @peeps = Chitter.all
    erb(:feed)
  end

  get '/sign_up' do
    erb(:sign_up)
  end

  post '/new_user' do
    if User.find_user(params[:username])
      flash[:username_dup] = 'username already exist'
      redirect '/sign_up'
    elsif params[:password] != params[:confirm_password]
      flash[:confirm_password] = "passwords don't match"
      redirect '/sign_up'
    else
      User.add_user(params[:username], params[:password], params[:email])
      User.find_user(paramas[:username])
      redirect '/feed'
    end
  end

end
