require 'pg'
require 'sinatra'
require 'sinatra/flash'
require_relative './lib/users.rb'
require_relative './lib/peep.rb'


class Chitter < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash

  get '/' do
    erb :home
  end

  post '/new-peep' do
    if session[:user_id] == nil
      flash[:notice] = 'Please log in before you peep'
      redirect('/')
    else
      Peep.create(text: params[:text], user_id: session[:user_id])
      redirect '/'
    end
  end

  get '/sign-up' do
    erb :sign_up
  end

  post '/sign-up' do
    user = Users.create(name: params[:name], email: params[:email], password: params[:password], username: params[:username])
    flash[:notice] = 'You are now signed up and in'  
    session[:user_id] = user.id

    redirect('/')
  end

  get '/sign-in' do
    erb :sign_in
  end

  post '/sign-in' do
    user = Users.authenticate(username: params[:username], password: params[:password])
    
    if user 
      session[:user_id] = user.id
      redirect('/')
    else
      flash[:notice] = 'Invalid details'
      redirect('/')
    end
  end

  get '/sign-out' do
    session.clear
    flash[:notice] = 'You have been signed out.'
    redirect('/')
  end

  run! if app_file == $0

end
