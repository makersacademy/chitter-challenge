require 'sinatra/base'
require './lib/user'
require_relative './lib/profile'
require_relative './database_connection_setup.rb'

class Chitter < Sinatra::Base

  enable :sessions, :method_override

  get '/' do
    erb :index
  end

  get '/peeps' do
    p "Can you see me here on line 15?"
    @profile = session[:profile_id]
    @peeps = User.all
    erb :'peeps/index'
  end

  get '/peeps/create' do
    erb :'peeps/create'
  end

  post '/peeps' do
    User.create(peep: params[:peep])
    redirect '/peeps'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    p "Can you see me?"
    session[:profile_id] = Profile.create(email: params[:email], password: params[:password], name: params[:name], username: params[:username])
    @profile = session[:profile_id]
    redirect '/peeps'
  end

  run! if app_file == $0

end
