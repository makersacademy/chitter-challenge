ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'

class NomDiaries < Sinatra::Base
  enable :sessions
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
    erb :'users/new'
  end

  post '/users' do
    user = User.create(email: params[:email], nom_name: params[:nom_name])
    session[:id] = user.id
    redirect to('/noms')
  end


  helpers do
    def current_user
      @current_user ||= User.get(session[:id])
    end
  end

end
