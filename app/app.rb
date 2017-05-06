ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require 'sinatra/flash'
require_relative './data_mapper_setup'

class Chitter < Sinatra::Base
  register Sinatra::Flash
  enable :sessions

  get '/' do
    redirect('/signup')
  end

  post '/signup' do
    user = User.create(name: params[:name], username: params[:username],
                       email: params[:email], password: params[:password],
                       password_confirmation: params[:confirm_password])
    session[:user_id] = user.id
    flash[:signup_error] = user.id ? '' : 'Passwords do not match.'
    redirect '/signup' unless user.id
    redirect '/home'
  end

  get '/signup' do
    erb(:signup)
  end

  get '/home' do
    "Welcome to Chitter, #{User.get(session[:user_id]).name}"
  end

  helpers do

  end
end
