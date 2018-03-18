require 'sinatra/base'
require 'rack'
require './database_connection_setup'
require './lib/account'
require './lib/peep'

class Chitter < Sinatra::Base

  get '/' do
    p Account.current_user
    erb(:index)
  end

  post '/peep' do
    if Account.current_user != nil
      Peep.post(params[:peep],params[:author])
    end
    redirect('/')
  end

  get '/sign_up' do
    erb(:sign_up)
  end

  post '/sign_up' do
    p params
    if params[:username] == "" || params[:password] == "" || params[:email] == ""
      p 'here'
      @invalid = true
      @message = 'you must fill in all fields'
      erb(:sign_up)
    else
      case (Account.sign_up(params[:username],params[:password],params[:email]))
      when 'invalid username'
        @invalid = true
        @message = 'that username is taken username'
        erb(:sign_up)
      when 'invalid email'
        @invalid = true
        @message = 'that email is taken'
        erb(:sign_up)
      else
        Account.login(params[:username],params[:password])
        redirect('/')
      end
    end
  end

  get '/login' do
    erb(:login)
  end

  post '/login' do
    if Account.login(params[:username],params[:password])
      redirect('/')
    end
    @invalid = true
    erb(:login)
  end

  post '/logout' do
    Account.logout
    redirect('/')
  end

  get '/user' do
    @user = params[:user]
    erb(:user)
  end

  run! if app_file == $0

end
