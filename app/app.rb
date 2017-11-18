ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require './app/data_mapper_config'
require_relative './models/peep'
require_relative './models/user'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'something'

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    redirect '/peeps'
  end

  get '/users/new' do
    erb :signup
  end

  get '/peeps' do
    @peeps = Peep.all.reverse
    erb :peeps
  end

  get '/:user' do
    @user = User.first(username: params[:user])
    erb :user_page
  end

  post '/users' do
    user = User.create(
      username: params[:username],
      email: params[:email],
      name: params[:name],
      password: params[:password],
      password_confirmation: params[:password_confrimation]
    )
    session[:user_id] = user.id
    redirect '/peeps'
  end

  post '/peeps' do
    user = User.get(session[:user_id])
    user.peeps << Peep.create(text: params[:peep], added: Time.now)
    user.save
    redirect '/peeps'
  end

  run! if app_file == $0
end
