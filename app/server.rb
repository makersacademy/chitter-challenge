require_relative './models/users'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    Chitter
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = Users.create(username: params[:username], password: params[:password], password_confirmation: params[:password_confirmation])
    session[:user_id] = user.id
    redirect('/peeps')
  end

  get '/users/log_in' do
    erb :'users/log_in'
  end

  get '/peeps' do
    erb :'peeps/index'
  end

  def current_user
    current_user ||= Users.get(session[:user_id])
  end


  run! if app_file == $0
end