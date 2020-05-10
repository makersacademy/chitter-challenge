require 'sinatra/base'
require './lib/peep'
require './lib/user'
require 'sinatra/flash'

class Chitter < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get '/peeps' do
    @result = Peep.all
    @user = session[:user]
    erb(:index)
  end

  get '/peeps/new' do
    erb(:new)
  end

  post '/peeps' do
    p "Form data submitted to the /peeps route!"
    Peep.add(peep: params[:peep])
    redirect('/peeps')
  end

  get '/peeps/signup' do
    erb(:signup)
  end

  post '/peeps/signup' do
    p "Form data submitted to the /signup route!"
    session[:user] = User.add(name: params[:name], email: params[:email],
      username: params[:username], password: params[:password])
    redirect('/peeps')
  end

  get '/peeps/login' do
    erb(:login)
  end

  post '/peeps/login' do
    if User.authenticate(username: params[:username], password: params[:password])
      session[:user] = User.get(username: params[:username])
      redirect('/peeps')
    else
      flash[:notice] = "The details do not match our records, please try again."
    end
  end

  post '/peeps/logout' do
    session[:user] = nil
    redirect('/peeps')
  end
end
