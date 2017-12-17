ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'sinatra/flash'
require './app/models/peep'
require './app/models/user'
require_relative 'helpers'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'session'
  register Sinatra::Flash
  use Rack::MethodOverride
  helpers Helpers

  get '/users/new' do
    @user = User.new
    erb :sign_up
  end

  post '/users' do
    @user = User.new(name: params[:name], username: params[:username],
    email: params[:email], password: params[:password],
    password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/peeps'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :sign_up
    end
  end

  get '/peeps' do
    @user = current_user
    @peeps = Peep.all
    erb :peeps
  end

  get '/peeps/new' do
    erb :new_peep
  end

  post '/peeps' do
    if current_user
      peep = Peep.create(user_id: session[:user_id],
      message: params[:message])
      peep.save
      redirect '/peeps'
    else
      flash.next[:error] = 'Must sign in first'
      redirect 'peeps/new'
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/peeps'
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'goodbye!'
    redirect '/peeps'
  end


run! if app_file == $0
end
