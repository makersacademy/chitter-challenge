require 'sinatra/base'
require './lib/peep.rb'
require './lib/user.rb'
require './database_connection_setup'
require 'sinatra/flash'

class Chitter < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get '/' do
    redirect '/login_or_sign_up' unless session[:username]
    @peeps = Peep.all
    erb(:index)
  end

  post '/' do
    Peep.save(peep: params[:peep], username: session[:username])
    redirect '/'
  end

  get '/login_or_sign_up' do
    erb(:login_or_sign_up)
  end

  get '/sign_up' do
    erb(:sign_up)
  end

  post '/confirm' do
    if User.already_exists?(username: params[:username])
      flash[:notice] = "Sorry, that username is already taken"
      redirect '/login_or_sign_up'
    elsif User.password_or_username_empty(username: params[:username], password: params[:password])
      flash[:notice] = "Sorry, you must specify a Username and Password"
      redirect '/login_or_sign_up'
    else User.save(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    end
    session[:username] = params[:username]
    erb(:confirm)
  end

  get '/usererror' do
    erb(:usererror)
  end

  get '/login' do
    erb(:login)
  end

  post '/login' do
    user = User.authenticate(params[:username], params[:password])

    if user
      session[:username] = user.username
      redirect '/'
    else
      flash[:notice] = "Sorry, incorrect password or username"
      redirect '/login_or_sign_up'
    end

  end

  post '/logout' do
    session.clear
    redirect '/'
  end

  run! if app_file == $0

end
