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
    # "PEEPS"
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

  run! if app_file == $0
end
