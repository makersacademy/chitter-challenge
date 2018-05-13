require 'sinatra/base'
require 'sinatra/flash'
require './lib/peep'
require './lib/user'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash


  # def set_current_user(user)
  #     session[:user_id] = user.id
  #     session[:user_username] = user.username
  #   end


  get '/' do
    'Testing infrastructure working!'
  end

  get '/peeps' do
    @user = User.get(session[:user_id])
    @peeps = Peep.all
    erb(:peepage)
  end

  get '/signup' do
    erb(:signupform)
  end

  post '/signup' do
    user = User.create(:username => params[:username], :password => params[:password])
    session[:user_id] = user.id
    redirect '/signupsuccess'
  end

  get '/signupsuccess' do
    @user = User.get(session[:user_id])
    erb(:signupsuccess)
  end

  get '/login' do
    erb(:loginform)
  end

  post '/login' do
    user = User.first(:username => params[:log_username])
    session[:user_id] = user.id
    redirect '/peeps'
  end

# User.get(test_user.id).username).to eq test_user.username
# user = User.first(:username => params[:log_username])


  run! if app_file == $0

end
