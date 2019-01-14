require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/base'
require './lib/user'
require_relative './lib/chirrup'

set :database_file, 'config/database.yml'

class Warble < Sinatra::Base

  register Sinatra::ActiveRecordExtension
  set :sessions, true
  set :method_override, true

  get '/' do
    @chirrups = Chirrup.all
    erb :index
  end

  post '/signin' do
    user = User.authenticate(params[:sign_in_username], params[:sign_in_password])
    if user
      session[:id] = user.id
      redirect "/private_profile/#{session[:id]}"
    else
      redirect '/'
    end
  end

  post '/signup' do
    user = User.create(
      username: params[:sign_up_username],
      email: params[:sign_up_email],
      password: params[:sign_up_password]
    )

    if user.valid?
      session[:id] = user.id
      redirect "/private_profile/#{session[:id]}"
    else
      redirect '/'
    end
  end

  get '/private_profile/:id' do
    if signed_in?
      @user = User.find(params[:id])
      erb :private_profile
    else
      redirect '/'
    end
  end

  delete '/sessions' do
    session.delete(:id)
    redirect '/'
  end

  get '/chirrup-board' do
    @chirrups = Chirrup.all
    erb :chirrup_board
  end

  post '/chirrup' do
    user = User.find(session[:id])
    chirrup = Chirrup.new(content: params[:chirrup])
    chirrup.user_id = user.id
    chirrup.save
    redirect '/chirrup-board'
  end

  get '/delete_profile/:id' do
    @user = User.find(params[:id])
    erb :delete_confirmation
  end

  delete '/delete_profile/:id' do
    @user = User.find(params[:id])
    session.delete(:id)
    @user.destroy
    redirect '/'
  end

  private

  def signed_in?
    !current_user.nil?
  end

  def current_user
    @current_user ||= User.find(session[:id])
  end

  run! if app_file == $0

end
