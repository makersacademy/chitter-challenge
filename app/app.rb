require 'bcrypt'
require 'sinatra/activerecord'
require 'sinatra/base'
require 'sinatra/flash'
require_relative './models/user'
require_relative './models/peep'

class Chitter < Sinatra::Base

  register Sinatra::ActiveRecordExtension

  enable :sessions

  register Sinatra::Flash

  get '/' do
    @peeps = Peep.order(created_at: :desc)
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
    erb :index
  end

  get '/register' do
    erb :register
  end

  post '/register' do
    @user = User.new(
      username: params[:username],
      email: params[:email],
    )

    @user.password = params[:password]

    if @user.save
      session[:user_id] = @user.id
      redirect '/'
    else
      flash[:notice] = 'The username or email provided is already in use. Please try again.'
      redirect '/register'
    end

  end

  get '/login' do
    erb :login
  end

  post '/login' do
    @user = User.find_by_email(params[:email])
    if @user&.password == params[:password]
      session[:user_id] = @user.id
      redirect '/'
    else
      flash[:notice] = 'Please check your email or password.'
      redirect '/login'
    end
  end

  get '/logout' do
    session.clear
    flash[:notice] = 'You have signed out.'
    redirect '/'
  end

  post '/new' do
    @peep = Peep.create(
      message: params[:message],
      user_id: session[:user_id]
    )
    redirect '/'
  end

  run! if app_file == $0
end
