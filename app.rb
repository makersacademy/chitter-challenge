require 'sinatra/base'
require 'pry'
require_relative './data_mapper_setup'

ENV['RACK_ENV'] ||= 'development'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, ''

  get '/' do
    @peeps = Peep.all.reverse
    @users = User.all
    erb :index
  end

  get '/sign_in' do
    erb :sign_in
  end

  post '/sign_in' do
    @user = User.login(params)
    session[:user] = @user.name
    session[:user_id] = @user.id
    redirect '/'
  end

  get '/sign_up' do
    erb :sign_up
  end

  get '/log_out' do
    session[:user] = nil
    session[:user_id] = nil
    redirect '/'
  end

  post '/peep' do
    Peep.create(text: params[:peep], date_time: DateTime.now, user_id: session[:user_id])
    redirect '/'
  end

  post '/sign_up' do
    params[:password] == params[:verify_password] ? register_user(params) : bad_password
  end

  def register_user(params)
    @user = User.create(params[:name], params[:email], params[:password])
    session[:user] = @user.name
    session[:user_id] = @user.id
    redirect '/'
  end
end
