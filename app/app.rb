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
    @current_user = current_user
    if current_user
      erb :new_peep
    else
      redirect '/peeps'
    end
  end

  get "/goto/peeps/new" do
    redirect '/peeps/new'
  end

  post '/peeps/new' do
    peep_msg = params[:peep]
    timestamp = Time.new.strftime("%H:%M:%S %a-%d-%b-%Y")
    new_peep = Peep.new(message: peep_msg, username: current_user.username,
      time: timestamp)
    current_user.peep << new_peep
    current_user.save
    redirect '/peeps'
  end

  get '/users/new' do
    @user = User.new
    erb :sign_up
  end

  get '/goto/users/new' do
    redirect 'users/new'
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
