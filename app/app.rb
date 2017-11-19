ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require './app/datamapper_setup'
require_relative 'app_helper'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'key'
  register Sinatra::Flash

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    @current_user = current_user
    erb :peeps
  end

  get '/peeps/new' do
    erb :new_peep
  end

  post '/peeps/new' do
    username = current_user ? current_user.username : params[:username]
    peep_msg = params[:peep]
    timestamp = Time.new.strftime("%H:%M:%S %a-%d-%b-%Y")
    Peep.create(message: peep_msg, username: username, time: timestamp)
    redirect '/peeps'
  end

  get '/users/new' do
    @user = User.new
    erb :sign_up
  end

  post '/users/new' do
    name = params[:name]
    username = params[:username]
    email = params[:email]
    password = params[:password]
    password_check = params[:password_confirmation]

    @user = User.new(
      name: name, username: username, email: email,
      password: password, password_confirmation: password_check
    )
    if !password.empty? && @user.save
      session[:user_id] = @user.id
      redirect '/peeps'
    else
      sign_up_error_message(username, email, password, password_check)
    end
  end

  run if app_file == $0
end
