require 'sinatra/base'
require 'sinatra/reloader'
require 'pg'
require './lib/chit'
require './lib/user'
require './lib/session'


class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions

  get '/' do
    @chits = Chit.all
    erb :index
  end

  get '/post_chit' do
    @chits = Chit.all
    user = session[:user]
    # @user_handle = user.handle
    erb :post_chit
  end

  post '/post_chit' do
    user = session[:user]
    Chit.post(handle: user.handle, content: params[:chit])
    redirect '/post_chit'
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up' do
    #rewrite this with an if else statement so that if the username 
    #exists in the database, it says so, and if the email exists in the database
    #it says so, and if both exist in the database, it says so
    begin
      session[:error_message] = ''
      #entering the posts page straight from signin doesn't transmit the session data. The result
      #is that you can't post unless you log in via the login page... need to work out 
      #how to get the sessions working 
      User.sign_up(full_name: params[:full_name], username: params[:username], handle: params[:handle], email: params[:email], password: params[:password])
      # session[:user] = user
      redirect '/sign_up_confirmation'
    rescue
      session[:error_message] = 'Sorry, username/email taken'
      redirect '/sign_up'
    end
  end

  get '/login' do
    erb :login
  end

  post '/login' do
  
    begin
      session[:error_message] = ''
      user = Session.find_user(handle: params[:handle], password: params[:password])
      session[:user] = user
      user = session[:user]
      redirect '/post_chit'
    rescue 
      session[:error_message] = 'Sorry, I cannot find that email/password'
      redirect '/login'
    end
  end


  get '/sign_up_confirmation' do
    erb :sign_up_confirmation
  end

  run! if app_file == $0
end
