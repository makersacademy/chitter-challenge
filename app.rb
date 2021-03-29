require 'sinatra/base'
require 'sinatra/flash'
require './database_setup'
require './lib/user.rb'
require './lib/message.rb'

class Chitter < Sinatra::Base
  enable :method_overide, :sessions
  # Need to register flash as well - using Sinatra::Base
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  get '/register' do
    erb :register
  end

  post '/register-details' do
    session[:email_invalid] = params[:email] if User.email_in_use?(params[:email])
    session[:username_invalid] = params[:username] if User.username_in_use?(params[:username])   
    redirect '/register' if session[:email_invalid] || session[:username_invalid]

    session[:new_user?] = params[:name]
    User.create_user(params[:name], params[:username], params[:email], params[:password])
    redirect '/'
  end

  post '/login' do
    session[:login_invalid] = true unless User.valid_login?(params[:username], params[:password])
    session[:logged_in?] = params[:username] unless session[:login_invalid]
    session[:user_id] = params[:username] unless session[:login_invalid]
    redirect '/'
  end

  post '/logout' do
    session.delete(:user_id)
    redirect '/'
  end

  post '/peep' do
    Message.create_peep(session[:user_id], params[:peep_text])
    redirect '/'
  end

end
