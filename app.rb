require 'sinatra/base'
require 'sinatra/flash'
require './lib/peep'
require_relative './database_connection_setup'
require_relative './lib/user'

class Chitter < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  get '/peeps' do
    @user = User.find(id: session[:user_id])
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps/new' do
    Peep.create(content: params[:content])
    redirect('/peeps')
  end

  delete '/peeps/:id' do
    Peep.delete(id: params[:id])
    redirect('/peeps')
  end

  get '/peeps/:id/edit' do
    @peep = Peep.find(id: params[:id])
    erb :'peeps/edit'
  end

  patch '/peeps/:id' do
    Peep.update(id: params[:id], content: params[:content])
    redirect('/peeps')
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users/new' do
    @user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = @user.id
    redirect('/peeps')
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])

    if user
      session[:user_id] = user.id
      redirect('/peeps')
    else
      flash[:notice] = 'Please check your email or password.'
      redirect('/sessions/new')
    end
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have signed out.'
    redirect('/')
  end

  run! if app_file == $0
end
