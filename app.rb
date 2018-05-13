require 'sinatra'
require 'sinatra/base'
require 'sinatra/flash'
require './lib/peep'
require './lib/user'
require 'pg'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get('/') do
    @peeps = Peep.all
    erb(:index)
  end

  post('/add') do
    if session[:username] == nil || params[:author] != session[:username]
      flash[:user_error] = "You cannot post as #{params[:author]} unless you sign in as #{params[:author]}"
    else
      Peep.create(params[:text], params[:author])
    end
    redirect('/')
  end

  get('/sign_up') do
    erb(:sign_up)
  end

  post('/sign_up') do
    User.create(params[:email], params[:password], params[:name], params[:username])
    session[:username] = params[:username]
    flash[:user] = "Welcome, #{session[:username]}"
    redirect('/')
  end

end
