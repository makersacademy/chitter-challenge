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

  get '/users/log-in' do
    erb :'users/log-in'
  end

  get '/users/sign-up' do
    @username = session['username']
    @email = session['email']
    @password_error = flash[:password_error]
    @username_error = flash[:username_error]
    @email_error = flash[:email_error]
    p flash
    erb :'users/sign-up'
  end

  post '/users/chitter-signup' do
    new_user = User.new(
              username:              params['username'],
              email:                 params['email'],
              password:              params['password'],
              password_confirmation: params['password_confirmation'])
    if new_user.save
    else
      save_entered_details
      process_errors(new_user)
      redirect('/users/sign-up')
    end
    redirect('/main/peeps')
  end

  get '/main/peeps' do
    'peeps'
  end

  get 'confirmpassword' do
    'Please confirm password'
  end

  def save_entered_details
    session['username'] = params['username']
    session['email'] = params['email']
  end

  def process_errors(new_user)
    errors = new_user.errors
    flash[:password_error] = SignupErrorHandler.run(errors, :password_error)
    flash[:username_error] = SignupErrorHandler.run(errors, :username_error)
    flash[:email_error] = SignupErrorHandler.run(errors, :email_error)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
