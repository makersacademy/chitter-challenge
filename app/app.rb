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
      redirect('/main/peeps')
    else
      save_entered_details
      process_errors(@new_user)
      erb :'users/sign-up'
    end
  end

  get '/main/peeps' do
    'peeps'
  end

  get 'confirmpassword' do
    'Please confirm password'
  end

  def save_entered_details
    @username = params['username']
    @email = params['email']
  end

  def process_errors(new_user)
    errors = new_user.errors
    flash.now[:password_error] = SignupErrorHandler.run(errors, :password_error)
    flash.now[:username_error] = SignupErrorHandler.run(errors, :username_error)
    flash.now[:email_error] = SignupErrorHandler.run(errors, :email_error)
    @password_error = flash[:password_error]
    @username_error = flash[:username_error]
    @email_error = flash[:email_error]
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
