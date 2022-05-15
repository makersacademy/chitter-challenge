require 'sinatra/base'
require 'sinatra/flash'

require_relative './lib/peep'
require_relative './lib/user'
require_relative './database_connection_setup'

class Chitter < Sinatra::Base
  register Sinatra::Flash
  enable :sessions, :method_override

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @user = User.find(id: session[:user_id])
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(body: params[:body], user_id: session[:user_id])
    redirect '/peeps'
  end

  get '/users/new' do
    erb :"users/new"
  end 

  post '/users' do
    user = User.create(
      email: params[:email],
      password: params[:password],
      name: params[:name],
      username: params[:username]
    )
    session[:user_id] = user.id
    redirect '/peeps'
  end

  get '/sessions/new' do
    erb :"sessions/new"
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
    redirect('/peeps')
  end
end