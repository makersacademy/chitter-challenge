require 'sinatra/base'
require 'sinatra/flash'
require_relative '../lib/peeps'
require_relative '../spec/test_database'
require_relative '../lib/database_setup'

class Chitter < Sinatra::Base
  enable :sessions
  enable :method_override
  register Sinatra::Flash

  get '/' do
    erb(:index)
  end

  get '/register/new' do
     erb(:register)
  end

  post '/register' do
    user = User.add(username: params[:username], password: params[:password], email: params[:email], name: params[:name])
    session[:user_id] = user.id
    redirect '/peeps'
  end

  post '/session' do
    user = User.login(username: params[:username], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect '/peeps'
    else
      flash[:notice] = "Invaild username or password given - try again."
      redirect '/'
    end
  end

  get '/peeps' do
    @user = User.list.find{ | user | user.id == session[:user_id] }
    @peeps = Peeps.list.reverse
    @users = User.list
    erb(:peeps)
  end

  post '/add_peep' do
    @user = User.list.find{ | user | user.id == session[:user_id] }
    Peeps.add(peep: params[:peep], user_id: @user.id)
    redirect '/peeps'
  end

  post '/logout' do
    session.clear
    redirect '/'
  end

  run! if app_file == $0
end
