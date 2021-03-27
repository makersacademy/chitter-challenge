require 'sinatra/base'
require 'pg'
require_relative 'lib/peeps'
require_relative 'db_connection_helper'
require_relative 'lib/user'
require_relative 'lib/db_connection'

class Chitter < Sinatra::Base

  enable :sessions, :method_override

  get '/' do
    @user = User.find_name_by_id(session[:user_id])
    erb(:index)
  end

  post '/login' do
    user = User.authenticate(params[:email],params[:password])
    session[:user_id] = user.first['id'] unless user.first == nil
    redirect '/'
  end

  post '/peep' do
    Peeps.post_peep(params[:peep_text])
    redirect '/'
  end

  get '/users/new' do
    erb(:signup)
  end

  post '/users' do
    User.create(params[:name],params[:email],params[:password])
    session[:name] = params[:name]
    session[:user_id] = User.find_id_by_email(params[:email])[0]['id']
    redirect '/'
  end

  run! if app_file == $0

end
