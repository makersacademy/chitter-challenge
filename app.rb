require 'sinatra/base'
require 'sinatra/flash'
require_relative './lib/user'


class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    if User.invalid_username?(params[:username])
      flash[:notice]="Sorry that username or email is already taken. Please try again."
      redirect '/users/new'
    elsif User.invalid_email?(params[:email])
      flash[:notice]="Sorry that username or email is already taken. Please try again."
      redirect '/users/new'
    else
      user = User.create(params[:name],params[:username],params[:email],params[:password])
      session[:current_user] = user.id
      flash[:welcome]="Welcome to Chitter #{user.username}"
      redirect '/peeps'
    end
  end

  get '/sessions/new' do
    erb :"sessions/new"
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:current_user] = user.id
      flash[:logged_in]="Logged in as @#{user.username}"
      redirect ('/peeps')
    else
      flash[:invalid_credentials] = "That email or password is incorrect. Please try again."
      redirect '/sessions/new'
    end
  end

  post '/sessions/destroy' do
    session.clear
    flash[:log_out]="You have successfully logged out. Come back soon."
    redirect '/'
  end

  get '/peeps' do
    @peeps = Peep.all.reverse
    erb :peeps
  end

  post '/peeps' do
    Peep.create(session[:current_user], params[:peep_input])
    redirect '/peeps'
  end

  run! if app_file == $0

end
