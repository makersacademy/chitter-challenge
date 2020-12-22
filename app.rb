require 'sinatra/base'
require 'sinatra/flash'
require './lib/peeps'
require './lib/users'

class Chitter < Sinatra::Base
  register Sinatra::Flash
  enable :sessions
  
  get '/chitter' do
    @peeps = Peeps.all
    @user = Users.logged_in(id: session[:id])
    erb :chitter
  end

  post '/chitter' do
    Peeps.add(body: params['post'])
    redirect '/chitter'
  end

  get '/users/signup' do
    erb :'/users/signup'
  end

  post '/sessions/new' do
    user = Users.sign_up(username: params['username'], email: params['email'], password: params['password'])
    session[:id] = user.id
    p session[:id]
    redirect '/chitter'
  end

  get '/users/login' do
    erb :'/users/login'
  end

  post '/sessions' do
    user = Users.authenticate(username: params[:username], password: params[:password])
    if user.save!
      session[:username] = user.id
      redirect '/chitter'
    else
      flash[:notice] = 'Please check your email or password and try again.'
      redirect '/users/login'
    end
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have logged out.'
    redirect('/chitter')
  end

   run! if app_file == $0
end
