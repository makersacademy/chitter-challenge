require 'sinatra/base'
require 'sinatra/flash'
require './lib/peeps'
require './lib/users'
require 'pg'

class Chitter < Sinatra::Base
  register Sinatra::Flash
  enable :sessions
  
  get '/chitter' do
    @peeps = Peeps.all
    @user = Users.logged_in(id: session[:user_id])
    erb :chitter
  end

  post '/chitter' do
    Peeps.add(body: params['post'])
    redirect '/chitter'
  end

  get '/users/signup' do
    erb :'/users/signup'
  end

  post '/users/new' do
    new_user = Users.sign_up(username: params['username'], email: params['email'], password: params['password'])
    session[:user_id] = new_user.id
    redirect '/chitter'
  end

  get '/users/login' do
    erb :'/users/login'
  end

  post '/users/login' do
    user = Users.authenticate(email: params[:email], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect '/chitter'
    else
      flash[:notice] = 'Please check your email or password and try again.'
      redirect '/users/login'
    end
  end

  post '/users/destroy' do
    session.clear
    flash[:notice] = 'You have logged out.'
    redirect('/chitter')
  end

   run! if app_file == $0
end
