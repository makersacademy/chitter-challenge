require 'sinatra/base'
require 'sinatra/flash'
require './lib/peep'
require './lib/user'
require './database_connection_setup'
require 'rubygems'
require 'email_address'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do

    @user = User.find(session[:user_id])

    @peeps = Peep.view_all_peeps
    erb :index
  end

  post '/peep/new' do
    Peep.new_peep(message: params[:message])
    redirect '/'
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    email = EmailAddress.new(params['email'])

    if email.valid?
      user = User.create(first_name: params[:first_name],
        last_name: params[:last_name],
        username: params[:username],
        email: params[:email],
        password: params[:password])
      session[:user_id] = user.id
      redirect '/'
    else
      flash[:notice] = "Please use a valid email address"
      redirect '/users/new'
    end

  end

  get '/sessions/new' do
    erb :"sessions/new"
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])

    if user
      session[:user_id] = user.id
      redirect('/')
    else
      flash[:notice] = 'Please check your email or password.'
      redirect('/sessions/new')
    end
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have signed out.'
    redirect('/')
  end

  run! if app_file == $0
end
