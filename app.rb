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
    redirect '/users/already_exists' if user.id.nil?
    session[:user_id] = user.id
    redirect '/'
  end

  get '/users/already_exists' do
    erb :user_already_exists
  end

  get '/sessions/new' do
    if session[:login_failed]
      @login_failed = true
      session[:login_failed] = nil
    end
    erb :sign_in
  end

  post '/sessions' do
    user = User.authenticate username: params[:username],
                             password: params[:password]

    if user.nil?
      session[:login_failed] = true
      redirect '/sessions/new'
    end

    session[:user_id] = user.id
    redirect '/'
  end

  delete '/sessions/delete' do
    session[:user_id] = nil
    redirect '/'
  end
end
