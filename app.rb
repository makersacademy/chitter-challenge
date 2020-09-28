require 'sinatra/base'
require 'sinatra/flash'
require './lib/peeps.rb'
require './lib/user.rb'

class Chitter < Sinatra::Base

  enable :sessions 
  register Sinatra::Flash

  get '/' do 
    @peeps = Peeps.all
    @user = User.find(session[:id])
    erb(:index)
  end 

  post '/' do 
    peep = params[:add_peep]
    Peeps.post(peep)
    redirect '/'
  end 

  get '/sign_up' do
    erb(:sign_up)
  end
  
  post '/sign_up' do 
    user = User.create(email: params[:email], password: params[:password], username: params[:username])
    session[:id] = user.id 
    redirect '/'
  end 

  get '/sessions' do 
    erb(:sessions)
  end 

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])
    if user
      session[:id] = user.id
      redirect('/')
    else
      flash[:notice] = 'Invalid email/password. Please try again.'
      redirect('/sessions')
    end
    redirect('/')
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'Signed out.'
    redirect('/sessions')
  end

end
