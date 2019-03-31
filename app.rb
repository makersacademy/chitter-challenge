require 'sinatra/base'
require_relative 'lib/peep'
require_relative 'lib/user'
require_relative 'lib/database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions, :method_override

  get '/' do
    @user = User.get session[:user_id]
    @peeps = Peep.all order: [:id.desc]
    erb :view_peeps
  end

  post '/peep' do
    @user = User.get session[:user_id]
    Peep.create content: params[:peep_content],
                user: @user
    redirect '/'
  end

  get '/users/new' do
    erb :sign_up
  end

  post '/users' do
    user = User.create name: params['name'],
                       username: params[:username],
                       email: params[:email],
                       password: params[:password]
    session[:user_id] = user.id
    redirect '/'
  end

  get '/sessions/new' do
    erb :sign_in
  end

  post '/sessions' do
    user = User.authenticate username: params[:username],
                             password: params[:password]
    redirect '/sessions/login_failed' if user.nil?
    session[:user_id] = user.id
    redirect '/'
  end

  delete '/sessions/delete' do
    session[:user_id] = nil
    redirect '/'
  end

  get '/sessions/login_failed' do
    erb :login_failed
  end
end
