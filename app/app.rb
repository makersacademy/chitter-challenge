ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, "super secret"

  helpers do
    def current_user
      @current_user ||= User.get(session[:id])
    end
  end

  get '/' do
    erb(:index)
  end

  get '/user/new' do
    erb(:signup)
  end

  post '/user' do
    user = User.create(email: params[:email], name: params[:name], username: params[:username], password: params[:password])
    session[:id] = user.id
    redirect('/')
  end

  run! if app_file == $0

end
