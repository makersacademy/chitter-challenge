require 'sinatra/base'
require 'database_cleaner'
require 'bcrypt'
require 'sinatra/flash'
require_relative 'data_mapper_setup'
require_relative 'models/user'

class Chitter < Sinatra::Base

  ENV["RACK_ENV"] ||= 'development'

  include BCrypt
  enable :sessions
  register Sinatra::Flash
  data_mapper_config

  get '/' do
    redirect('/log_in')
  end

  get '/log_in' do
    session['user'] = nil
    User.create(name: "Guest", username: "Guest")  if User.first(:username => "Guest") == nil
    erb :log_in
  end

  get '/sign_up' do
    @sign_up_error = session['sign_up_error'] if session['sign_up_error'] != nil
    erb :sign_up
  end

  post '/sign_up' do
    User.check_if_user_exists(params[:Username], params[:Email])
    if User.check_if_user_exists(params[:Username], params[:Email]) != (nil || false)
      session['sign_up_error'] = User.check_if_user_exists(params[:Username], params[:Email])
      redirect('/sign_up')
    end
    if !User.check_confirm_password(params[:Password], params[:ConfirmPassword])
      session['sign_up_error'] = "Confirm Password must match Password"
      redirect('/sign_up')
    end
    password_digest = Password.create(params[:Password])
    User.create(email: params[:Email], username: params[:Username], name: params[:Name], password_digest: password_digest)
    redirect('/log_in')
  end

  post '/log_in' do
    if !!User.first(:username => params[:Username])
      if User.check_password(params[:Username], params[:Password])
        flash[:password] = "Password Incorrect"
        redirect('/log_in')
      end
      session['user'] = User.first(:username => params[:Username])
      redirect('/homepage')
    else
      flash[:username] = "User #{params[:Username]} does not exist"
      redirect('/log_in')
    end
  end

  post '/homepage' do
    session['user'] = User.first(:username => "Guest")
    redirect('/homepage')
  end

  get '/homepage' do
    @user = session['user']
    erb :homepage
  end

  run! if app_file == $0

end
