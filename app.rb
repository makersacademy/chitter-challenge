require 'sinatra/base'
require 'sinatra/flash'
require 'uri'
require_relative 'lib/message'
require_relative 'lib/user'
require_relative 'database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    @user = User.find(id: session[:user_id])
    @messages = Message.all
    erb :index
  end

  get '/write-peep' do
    @user = User.find(id: session[:user_id])

    if @user
      erb :write_peep
    else
      flash[:notice2] = 'You must be signed in to write a Peep!'
      redirect '/'
    end
  end

  post '/peeps' do
    user = User.find(id: session[:user_id])
    Message.create(content: params['content'], user_name: user.name,
      user_handle: user.username
    )
    redirect '/'
  end

  get '/users/sign-up' do
    erb :sign_up
  end

  post '/users' do
    if User.email_exist?(email: params[:email])
      flash[:notice] = "Email address already in use"
      redirect '/users/sign-up'
    elsif User.username_exist?(username: params[:username])
      flash[:notice] = "Username already in use"
      redirect '/users/sign-up'
    else
      user = User.create(name: params[:name],
        username: params[:username],
        email: params[:email],
        password: params[:password]
      )
      session[:user_id] = user.id
      redirect '/'
    end
  end

  get '/users/sign-in' do
    erb :sign_in
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])

    if user
      session[:user_id] = user.id
      redirect('/')
    else
      flash[:notice] = 'Please check your email or password.'
      redirect('/users/sign-in')
    end
  end

  post '/users/sign-out' do
    session.clear
    flash[:notice] = 'You have signed out.'
    redirect('/')
  end

  run! if app_file == $0

end
