require 'pg'
require 'sinatra/base'
require 'sinatra/flash'
require './lib/user.rb'
require './lib/peep.rb'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb:'homepage'
  end

  get '/sessions/new' do
    erb:'logging_in'
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have signed out.'
    redirect('/')
  end

  post '/sessions' do
    user = User.authenticate(username: params[:username], password: params[:password])
  
    if user
      session[:user_id] = user.id
      redirect('/interface')
    else
      flash[:notice] = 'Please check your email or password.'
      redirect('/sessions/new')
    end
  end

  get '/interface' do
    @user = User.find(session[:user_id])
    @peeps = Peep.all(session[:user_id])
    erb:'interface'
  end

  post '/peep/new' do
    @user = User.find(session[:user_id])
    Peep.add(text: params[:text], user_id: session[:user_id], time: Time.now.strftime("%H:%M"))
    redirect '/interface'
  end

  get '/register/new' do
    erb:'register'
  end

  post '/register' do
  user = User.create(email: params[:email], password: params[:password], name: params[:name], username: params[:username])
  session[:user_id] = user.id
  redirect '/'
  end


  run! if app_file == $0
end
