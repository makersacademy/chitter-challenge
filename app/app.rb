require 'sinatra/base'
require_relative 'data_mapper_setup'
require './app/helpers/user_helper'
require 'sinatra/flash'

class App < Sinatra::Base
  helpers UserHelpers
  register Sinatra::Flash
  use Rack::MethodOverride
  enable :sessions
  set :session_secret, 'super secret'

  # get '/user/:id' do
  #   p params[:id]
  #   @user = User.get(params[:id])
  #   erb :'users/name'
  # end

  get '/users/:id/peeps' do
    user = User.get(params[:id]) || User.get(session[:user_id])
    @peeps = user.peeps
    erb :'peeps/index'
  end

  get '/users/:id/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    peep = Peep.new(content: params[:content], created_at: Time.now)
    peep.user_id = session[:user_id]
    if peep.save
      redirect to '/users/:id/peeps'
    else
      flash[:notice] = 'Please sign in'
      redirect to '/sessions/new'
    end
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.new(email: params[:email],
                    name: params[:name],
                    nickname: params[:nickname],
                    password: params[:password],
                    password_confirmation: params[:password_confirmation])
    if user.save
      session[:user_id] = user.id
      flash[:notice] = "Successfully signed up"
      redirect to '/users/:id/peeps'
    else
      flash.now[:errors] = user.errors.full_messages
      erb :'/users/new'
    end

  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to "/users/#{user.id}/peeps"
    else
      flash.now[:notice] = 'Email or password is invalid'
      erb :'/sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash[:notice] = "Good bye!"
    redirect to '/sessions/new'
  end

  get '/email_verification' do
    erb :'users/email_verification'
  end

  post '/email_verification' do
    user = User.first(email: params[:email])
    if user
      user.password_token = generate_password_token
      user.save
      flash.now[:notice] = 'Email sent. Please check your email'
      erb :'users/email_verification'
    else
      flash.now[:notice] = 'Email not found'
      erb :'users/email_verification'
    end
  end

  get '/users/password_reset/:password_token' do
    session[:password_token] = params[:password_token]
    erb :'users/password_reset'
  end

  post '/password_reset' do
    user = User.first(password_token: session[:password_token])
    user.update(password: params[:password],
      password_confirmation: params[:password_confirmation])
    if user.save
      flash[:notice] = 'Password is successfully reset'
      session[:user_id] = user.id
      redirect 'users/:id/peeps'
    else
      flash.now[:errors] = user.errors.full_messages
      erb :'users/password_reset'
    end
  end
end
