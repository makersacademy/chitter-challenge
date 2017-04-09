ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class NomDiaries < Sinatra::Base
  use Rack::MethodOverride
  enable :sessions
  register Sinatra::Flash
  set :session_secret, 'super secret'

  get '/' do
    redirect 'noms'
  end

  get '/noms' do
    @noms = Nom.all
    erb :'/noms/index'
  end

  get '/noms/new' do
    erb :'noms/new'
  end

  post '/noms' do
    nom = Nom.new(nom: params[:nom], posted: Time.now)
    nom.save
    redirect to('/noms')
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.new(email: params[:email],
                        nom_name: params[:nom_name],
                        password: params[:password],
                        password_confirmation: params[:password_confirmation])
    if @user.save
      session[:id] = @user.id
      redirect to('/noms')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  get '/sessions/new' do
    erb :'/sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:id] = user.id
      redirect to('/noms')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:id] = nil
    flash.keep[:notice] = 'goodbye!'
    redirect to '/noms'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:id])
    end
  end

end
