require 'sinatra/base'
require './lib/peep.rb'
require './lib/user.rb'
require './database_connection_setup'

class Chitter < Sinatra::Base

  enable :sessions

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
      redirect '/nameerror'
    elsif params[:username] == "" || params[:password] == ""
      redirect '/signuperror'
    else User.save(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    end
    session[:username] = params[:username]
    erb(:confirm)
  end

  get '/nameerror' do
    erb(:nameerror)
  end

  get '/usererror' do
    erb(:usererror)
  end

  get '/passworderror' do
    erb(:passworderror)
  end

  get '/login' do
    erb(:login)
  end

  get '/signuperror' do
    erb(:signuperror)
  end

  post '/login' do
    redirect '/usererror' unless User.already_exists?(username: params[:username])
    user = User.authenticate(params[:username], params[:password])

    if user
      session[:username] = user.username
      redirect '/'
    else
      redirect '/passworderror'
    end

  end

  post '/logout' do
    session.clear
    redirect '/'
  end

  run! if app_file == $0

end
