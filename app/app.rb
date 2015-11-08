require 'sinatra/base'
require 'sinatra/flash'
require './app/models/data_mapper_setup'
require './lib/signup_error_handler'

ENV['RACK_ENV'] ||= 'development'


class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'Schubert'
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  get '/users/login' do
    redirect('/main/peeps') if not session[:user_id].nil?
    erb :'users/login'
  end

  get '/users/sign-up' do
    erb :'users/sign-up'
  end

  post '/users/chitter-signup' do
    @new_user = User.new(
              username:              params['username'],
              email:                 params['email'],
              name:                  params['name'],
              password:              params['password'],
              password_confirmation: params['password_confirmation'])
    if @new_user.save
      session[:user_id] = @new_user.id
      redirect('/main/peeps')
    else
      save_entered_details
      process_errors(@new_user)
      assign_errors
      erb :'users/sign-up'
    end
  end

  get '/main/peeps' do
    @name ||= User.first_name(session[:user_id])
    erb :'main/peeps'
  end

  get 'confirmpassword' do
    'Please confirm password'
  end

  post '/users/chitter-login' do
    @user = User.authenticate(params['username'], params['password'])
      if @user
        session[:user_id] = @user.id
        redirect('/main/peeps')
      else
        save_entered_details
        flash.now[:login_failed] = :failed_authentication
        @login_error = flash[:login_failed]
        erb :'/users/login'
      end
  end

  get '/logout' do
    @name = User.first_name(session[:user_id])
    session[:user_id] = nil
    erb :'users/logout'
  end

  private

  def save_entered_details
    @username = params['username']
    @email = params['email']
  end

  def process_errors(new_user)
    errors = new_user.errors
    flash.now[:password_error] = SignupErrorHandler.run(errors, :password_error)
    flash.now[:username_error] = SignupErrorHandler.run(errors, :username_error)
    flash.now[:email_error] = SignupErrorHandler.run(errors, :email_error)
    flash.now[:min_length_error] = SignupErrorHandler.run(errors, :min_length_error)
  end

  def assign_errors
    @password_error = flash[:password_error]
    @username_error = flash[:username_error]
    @email_error = flash[:email_error]
    @length_error = flash[:min_length_error]
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
