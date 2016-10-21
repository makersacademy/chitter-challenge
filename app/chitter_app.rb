ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'


class ChitterApp < Sinatra::Base

enable :sessions
set :session_secret, 'super secret'
register Sinatra::Flash

  get '/' do
    erb :'landing_page'
  end

  get '/users/register' do
    erb :'users/register'
  end

  get '/users/sign_in' do
    erb :'users/sign_in'
  end

  post '/users/new_user_authenticate' do
    @user = User.create(first_name: params[:first_name],
                   last_name: params[:last_name],
                   email: params[:email],
                   password: params[:password],
                   password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/links'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/register'
    end
  end

  post '/users/existing_user_authenticate' do

  end


  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end




  # start the server if ruby file executed directly
  run! if app_file == $0
end
