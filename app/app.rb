ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'rest_client'
require_relative 'dm_setup'

class ChitterApp < Sinatra::Base

  register Sinatra::Flash
  enable :sessions

  helpers do
    def current_user
      @current_user ||= User.get(session[:id])
    end
  end


  get '/' do
    erb :peeps
  end

  post '/peeps/new' do
    # move peep into current_user?
    Peep.create(message: params[:message],
                author: current_user.real_name,
                handle: current_user.username,
                time: Time.now)

    # prevent invalid peep creation?
    redirect to '/'
  end

  get '/users/sign_up' do
    erb :sign_up
  end

  post '/users/sign_up' do
    new_user = User.create(
                          username:   params[:username],
                          real_name:  params[:real_name],
                          email:      params[:email],
                          password:   params[:password],
                          password_confirmation: params[:password_confirmation]
                          )

    if new_user.valid?
      session[:id] = new_user.id
      redirect to '/'
    else
      flash.now[:errors] = new_user.errors.full_messages
      erb :sign_up
    end
  end


  get '/users/sessions/sign_out' do
    flash.keep[:goodbye] = "See ya, #{current_user.real_name}"
    session[:id] = nil
    redirect to '/'
  end


  get '/users/sessions/new' do
    erb :sign_in
  end


  post '/users/sessions/new' do
    user = User.authenticate(params[:email],
                             params[:password]
                             )

    if user
      session[:id] = user.id
      redirect to '/'
    else
      flash.now[:invalid_login] = "Login details incorrect"
      erb :sign_in
    end
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
