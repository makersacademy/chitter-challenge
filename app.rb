require_relative 'database_connection_setup'
require 'sinatra'
require 'sinatra/flash'
require_relative './lib/user'

class ChitterWebApp < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb(:login)
  end

  get '/sign_up' do
    erb(:sign_up)
  end

  post '/feed' do
    if User.find_user(params[:username]) == false
      flash[:username] = 'username does not exist'
      redirect '/'
    elsif User.login_correct?(params[:username], params[:password]) == false
       flash[:password] = 'incorrect password'
       redirect '/'
    else
      redirect '/feed'
    end
  end

end
