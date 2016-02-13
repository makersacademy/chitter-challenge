ENV['RACK_ENV'] = 'development'

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
    redirect to '/peeps' if current_user
    erb :index
  end

  get '/peeps' do
    redirect to '/' unless current_user
    erb :peeps
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
      redirect to '/peeps'
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






  # start the server if ruby file executed directly
  run! if app_file == $0
end
