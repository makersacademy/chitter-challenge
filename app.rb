require 'sinatra/base'
require './lib/peep'
require './database_connection_setup'

class Chitter < Sinatra::Base
  get '/' do
    @user = User.find(session[:user_id])
    @peeps = Peep.view_all_peeps
    erb :index
  end

  post '/peep/new' do
    Peep.new_peep(message: params[:message])
    redirect '/'
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    User.create(first_name: params[:firstname],
      last_name: paramas[:lastname],
      username: params[:username],
      email: params[:email],
      password: params[:password])
    session[:user_id] = user.id
    redirect '/'
  end

  get '/sessions/new' do
    erb :"sessions/new"
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])

    if user
      session[:user_id] = user.id
      redirect('/')
    else
      flash[:notice] = 'Please check your email or password.'
      redirect('/sessions/new')
    end
  end

  run! if app_file == $0
end
