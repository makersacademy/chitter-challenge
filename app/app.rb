require 'sinatra/base'
ENV['RACK_ENV'] ||= 'development'
require_relative './models/data_mapper_setup'

class Chitter < Sinatra::Base

  enable :sessions
  get '/' do
    'Hello Chitter!'
  end

  get '/sign-up' do
    erb :sign_up
  end

  post '/sign-up' do
    user = User.create(name: params[:name],
                email: params[:email],
                password: params[:password])
    session[:user_id] = user.id
    redirect '/peeps'
  end

  get '/peeps' do
    erb :peeps
  end

  # start the server if ruby file executed directly
  run! if app_file == $0

  helpers do
    def current_user
      User.get(session[:user_id])
    end
  end
end
