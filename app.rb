require './lib/database_setup'
require 'rack'
require 'sinatra/base'
require './lib/peep'
require './lib/formats'

class Chitter < Sinatra::Base
  enable :sessions

  get '/chitter' do
    @user = session[:username]
    @peeps = Peep.all
    erb :chitter
  end

  get '/chitter/user/new' do
    erb :new_user
  end

  post '/chitter/user' do
    session[:username] = params[:username]
    DatabaseConnection.query("INSERT INTO users(name, username, email, password) VALUES ('#{params[:name]}', '#{params[:username]}', '#{params[:email]}', '#{params[:password]}');")
    redirect '/chitter'
  end
end
