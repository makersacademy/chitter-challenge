ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'


class Chitter < Sinatra::Base
  register Sinatra::Flash
  set :sessions, true
  set :session_secret, 'super secret'

  helpers do
    def session_user
      @session_user ||= User.get(session[:user_id])
    end

    def sign_up_errors?
      @new_user.errors.full_messages.size > 0
    end

    def sign_up_errors
      @new_user.errors.full_messages
    end

    def sign_in_error_type
      if @user.nil? && User.first(user_name: params[:existing_user_name])
        'Access Denied Impersonator'
      else
        'Brother, is that really you?'
      end
    end


  end

  get '/' do
    @new_user = User.new
    erb :'user/index'
  end

  post '/sign_up' do
    @new_user = User.new(user_name: params[:user_name],
    email: params[:email],
    password: params[:password],
    password_confirmation: params[:password_confirmation])

    if @new_user.save
      session[:user_id] = @new_user.id
      redirect '/welcome'
    else
      flash.now[:error_password] =
      sign_up_errors.select {|message| message.include? 'Dur-brain'}.join("/n")
      flash.now[:error_user_name] =
      sign_up_errors.select {|message| message.include? 'Brother'}.join("/n")
      flash.now[:error_email] =
      sign_up_errors.select {|message| message.include? 'Friend'}.join("/n")
      flash.now[:new_user_email_memo] = @new_user.email
      flash.now[:new_user_user_name_memo] = @new_user.user_name
    end
    erb :'user/index'
  end


  post '/sign_in' do
    @user =
      User.authenticate(params[:existing_user_name], params[:existing_password])
    if @user
      session[:user_id] = @user.id
      redirect '/welcome'
    else
      flash.now[:authentication_error] = sign_in_error_type
      erb :'user/index'
    end
  end

  get '/welcome' do
    @user = session_user.user_name
    erb :'user/welcome'
  end


  run! if app_file == $0
end


# register Sinatra::Partial
# use Rack::MethodOverride
# set :partial_template_engine, :erb
# enable :partial_underscores
