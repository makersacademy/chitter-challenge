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

  get '/login_or_sign_up' do
    erb(:login_or_sign_up)
  end

  get '/peep' do
    erb(:peep)
  end

  post '/peep' do
    Peep.save(peep: params[:peep], username: session[:username])
    redirect '/'
  end

  get '/sign_up' do
    erb(:sign_up)
  end

  post '/confirm' do
    if User.already_exists?(username: params[:username])
      flash[:notice] = "Sorry, that username is already taken"
      redirect '/login_or_sign_up'
    elsif params[:username] == "" || params[:password] == ""
      flash[:notice] = "Sorry, inappropriate Username or Password"
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
    redirect '/usererror' unless User.already_exists?(username: params[:username])
    user = User.authenticate(params[:username], params[:password])

    if user
      session[:username] = user.username
      redirect '/'
    else
      flash[:notice] = "Sorry, incorrect password"
      redirect '/login_or_sign_up'
    end

  end

  post '/logout' do
    session.clear
    redirect '/'
  end

  run! if app_file == $0

end
