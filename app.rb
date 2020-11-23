require 'dotenv/load'
require 'sinatra/base'
require 'sinatra/flash'
require './database_connection_setup.rb'
require './lib/user'
require './lib/peep'

class ChitterController < Sinatra::Base
  enable :sessions
  set :session_secret, ENV['SESSION_SECRET']
  register Sinatra::Flash

  get '/' do
    redirect('/app') if session[:user]
    erb(:login_page)
  end

  get '/create-account' do
    erb(:register)
  end

  post '/create-account' do
    if User.create(username: params[:username], email: params[:email], password: params[:password])
      flash[:notice] = "Account created succesfully, log in below!"
      redirect('/')
    else
      flash[:notice] = "Account name/email exist, try again!"
      redirect('/create-account')
    end
  end

  post '/sessions' do
    user = User.authenticate(username: params[:username], password: params[:password])

    if user
      session[:user] = user
      redirect('/app')
    else
      flash[:notice] = "Account name or password invalid, try again!"
      redirect('/')
    end    
  end

  get '/sessions/destroy' do
    session.clear
    flash[:notice] = 'you have logged off.'
    redirect('/')
  end

  get '/app' do
    erb(:app)
  end

  get '/app/new-peep' do
    erb(:new_peep)
  end

  post '/app' do
    peep = Peep.create(body: params[:content], user_id: session[:user].id)
    if peep
      redirect('/app')
    else
      flash[:notice] = "Peeps can't be over 140 characters"
      redirect('/app/new-peep')
    end
  end

  get '/app/:id/delete' do
    peep = Peep.find(params[:id])
    Peep.delete(peep.id) if peep.author == session[:user].username
    redirect('/app')
  end

  get '/app/:id/favourite' do
    session[:user].favourite_a_peep(params[:id])
    redirect('/app')
  end

  run! if app_file == $0
end
