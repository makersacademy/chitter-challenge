require 'sinatra/base'
require './lib/peep'
require './lib/user'
require './database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb(:index)
  end

  get '/peeps' do
    @peeps = Peep.all(id: session[:id])
    @email = session[:email]
    erb(:peeps)
  end

  post '/peeps/new' do
    Peep.create(description: params[:peep],id: session[:id]).first
    redirect('/peeps')
  end

  get '/login' do 
    erb(:login)
  end

  post '/login' do
    user = User.login(params[:email],params[:pwd])
    if user
    session[:id] = user.id
    session[:email] = user.email
    redirect('/peeps')
    else
    redirect('/')
    end
  end

  get '/signup' do
    erb(:signup)
  end

  post '/signup' do
    @user = User.create(params)
    if @user
    session[:id] = @user.id
    session[:email] = @user.email
    redirect('/peeps')
    end
    redirect('/')
  end

  post '/logout' do
    session.clear
    redirect('/')
  end

end
