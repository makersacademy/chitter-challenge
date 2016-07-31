ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup.rb'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super_secret'

  get '/' do
    'Hello Chitter!'
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(username: params[:username],
                name: params[:name],
                email: params[:email])
                # password: params[:password],
                # password_confirmation: params[:password_confirmation])
    if @user.save ##save returns true/false depending on whether the model is successfully saved to the database
      session[:user_id] = @user.id
      redirect '/links'
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
