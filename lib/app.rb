ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'rubygems'
require_relative 'data_mapper_setup'

class App < Sinatra::Base

  register Sinatra::Flash
  set :sessions, true

  get '/register' do
    erb :register
  end

  post '/register' do
    @user = User.new(name: params[:name], username: params[:username], email: params[:email],
                        password_confirmation: params[:password_confirmation])
    @user.password = params[:password]
    if @user.save
      flash.keep[:message] = :welcome
      redirect "/#{@user.username}/peeps"
    else
      flash[:errors] = @user.errors.full_messages
      erb :register
    end
  end

  get '/:username/peeps' do
    @user = User.first(:username => params[:username])
    erb :'user/peeps'
  end

  get '/login' do
    erb :login
  end

  post '/login' do
    @user = User.authenticate(params[:email], params[:password])
    if @user
      flash.keep[:message] = :welcome_back
      redirect "/#{@user.username}/peeps"
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
