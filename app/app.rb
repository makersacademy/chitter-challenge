ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'models/peep'
require_relative 'models/user'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  enable :sessions
  set    :session_secret, 'super secret'

  get '/' do
    redirect '/signup'
  end

  get '/signup' do
    erb :index
  end

  post '/welcome' do
    user = User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    session[:username] = user.username
    user.save
    redirect '/welcome'
  end

  get '/welcome' do
    @user = session[:username]
    erb :welcome
  end

  run! if app_file == $PROGRAM_NAME
end
