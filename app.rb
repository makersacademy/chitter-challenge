require 'sinatra/base'
require_relative './lib/peep'
require_relative './lib/peep_comment'
require_relative './lib/user'
require_relative './lib/database_connection'

class Chitter < Sinatra::Base

  DatabaseConnection.setup

  before {@active = User.active}

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  post '/new_peep' do
    Peep.create(params[:new_peep])
    redirect '/'
  end

  get '/register' do
    erb :register
  end

  post '/register' do
    @user = User.create(params[:username], params[:name], params[:email], params[:password])
    erb :user_details
  end

  get '/login' do
    erb :login
  end

  post '/login' do
    User.log_in(params[:username], params[:password])
    redirect '/'
  end

  get '/logout' do
    User.log_out
    redirect '/'
  end

  get '/add_comment' do
    Comment.create(params[:new_comment])
    redirect '/'
  end
end
