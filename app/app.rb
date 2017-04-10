ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require 'sinatra/flash'
require_relative 'datamapper_setup'

class Chitter < Sinatra::Base
  use Rack::MethodOverride
  register Sinatra::Flash
  enable :sessions

  get '/peeps/new' do
    if current_user == nil
      flash.keep[:login] = 'You are not logged in, please log in or sign up'
      redirect '/users/new'
    else
      erb :'peeps/new'
    end
  end

  post '/peeps' do
    peep = Peep.create(
    user: current_user,
    content: params[:content],
    time: params[:time] = Time.now.strftime('%c')
    )
    peep.save
    redirect '/feed'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(email: params[:email],
                        name: params[:name],
                        username: params[:username],
                        password: params[:password],
                        password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/feed'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  get '/feed' do
    @peeps = Peep.all
    erb :feed
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email],params[:password])
    if user
      session[:user_id] = user.id
      redirect '/feed'
    else
      flash.now[:errors] = 'The email or password is incorrect'
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'You are now logged out. Goodbye!'
    redirect '/sessions/new'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end

  end

end
