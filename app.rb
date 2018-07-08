require 'sinatra/base'
require 'sinatra/flash'
require_relative './lib/user'


class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  get '/sign-up' do
    erb :sign_up
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

  post '/sign-up' do
    if User.invalid_username?(params[:username])
      flash[:notice]="Sorry that username or email is already taken. Please try again."
      redirect '/sign-up'
    elsif User.invalid_email?(params[:email])
      flash[:notice]="Sorry that username or email is already taken. Please try again."
      redirect '/sign-up'
    else
      user = User.create(params[:name],params[:username],params[:email],params[:password])
      session[:current_user] = user.id
      flash[:welcome]="Welcome to Chitter #{user.username}"
      redirect '/peeps'
    end
  end

  get '/peeps' do
    @peeps = Peep.all.reverse
    erb :peeps
  end

  post '/peeps' do
    @user_id = session[:current_user]
    Peep.create(@user_id, params[:peep_input])
    redirect '/peeps'
  end

  run! if app_file == $0

end
