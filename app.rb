require 'sinatra/base'
require 'sinatra/flash'
require 'uri'
require './database_connection_setup'
require './lib/user'
# require './lib/peep'

class Chitter < Sinatra::Base

  enable :sessions

  get '/peeps' do
    # fetch the user from the database, using an ID stored in the session
    @user = User.find(session[:user_id])
    # @peeps = Peep.all
    erb :index
  end

  get '/users/new' do
    # sign_up form:
    erb :"users/new"
  end

  post '/users' do
    user = User.create(name: params[:name], email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/peeps'
  end

  get '/sessions/new' do
    erb :"sessions/new"
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])
    # result = DatabaseConnection.query("SELECT * FROM users WHERE email = #{params[:email]}")
    # user = User.new(result[0]['id'], result[0]['name'], result[0]['email'], result[0]['password'])

    session[:user_id] = user.id
    redirect '/peeps'
  end

  run! if app_file == $0
end
