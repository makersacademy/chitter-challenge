require 'sinatra/base'
require 'sinatra/flash'
require './lib/user'
require './lib/peep'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  post '/sign_up' do
    user = User.create(name: params[:name], email: params[:email], username: params[:username], password: params[:password])
    session[:user_id] = user.id
    redirect '/welcome'
  end

  post '/log_in' do
    @user = User.authenticate(email: params[:existing_email], password: params[:existing_password])
    if @user
      session[:user_id] = @user.id
      redirect '/welcome'
    else
      flash[:notice] = 'Error: The email you have entered is not in our system'
      redirect('/')
    end
  end

  get '/welcome' do
    @user = User.find(id: session[:user_id])
    @users = User.all
    erb :welcome
  end

  get '/user/:id' do
    @user = User.find(id: session[:user_id])
    @peeps = Peep.where(user_id: session[:user_id])
    erb :user
  end

  post '/peep' do
    @user = User.find(id: session[:user_id])
    Peep.create(user_id: session[:user_id], peep: params[:peep])
    redirect '/user/:id'
  end

  run! if app_file == $0
end
