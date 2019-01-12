ENV["RACK_ENV"] ||= 'development'

require 'sinatra'
require 'sinatra/activerecord'
require './lib/user'
require './lib/peep'


set :database_file, "config/database.yml"

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    user = User.create(email: params[:email], password: params[:password], name: params[:name], username: params[:username])
    session[:id] = user.id
    redirect "/profile/#{session[:id]}"
  end

  post '/signin' do
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:id] = user.id
      redirect "/profile/#{session[:id]}"
    else
      redirect '/'
    end
  end

  get '/profile/:id' do
    @user = User.find(params[:id])
    erb :profile
  end

  post '/peep/:id' do
    user = User.find(params[:id])
    Peep.create(user_id: user.id, content: params[:content])
    redirect "/profile/#{params[:id]}"
  end

end