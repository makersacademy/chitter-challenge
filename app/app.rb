require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'
ENV['RACK_ENV'] ||= 'development'
require_relative './models/data_mapper_setup'

class Chitter < Sinatra::Base

use Rack::MethodOverride
  register Sinatra::Flash
  register Sinatra::Partial
  enable :sessions
  get '/' do
    redirect '/sign-up'
  end

  get '/sign-up' do
    erb :sign_up
  end

  post '/sign-up' do
    user = User.new(name: params[:name],
                email: params[:email],
                password: params[:password],
                password_confirmation: params[:password_confirmation])
    if user.save
      session[:user_id] = user.id
      redirect '/peeps'
    else
      flash.next[:errors] = user.errors.full_messages
      redirect '/sign-up'
    end
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end
  get '/peeps' do
    erb :peeps
  end

  # start the server if ruby file executed directly
  run! if app_file == $0


end
