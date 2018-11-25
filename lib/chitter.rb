require 'sinatra/base'
require './database_connection_setup'
require_relative './views/view_helpers'
require_relative './models/peep'
require_relative './models/user'

require 'sinatra/flash'
class Chitter < Sinatra::Application
  include ViewHelpers
  set :sessions, true
  set :layout, true

  get '/sessions/new' do
    erb(:"sessions/new")
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

  get '/users/new' do
    erb(:'users/new')
  end

  post '/users' do
    user =  User.create(user_name: params['user_name'],
                email: params['email'],
                password: params['password'],
                name: params['name'])
    session[:user_id] = user.id
    redirect '/peeps'
  end

  get '/peeps' do
    @user = User.find(session[:user_id])
    @peeps = Peep.all
    erb(:'peeps/index')
  end

  get '/peeps/new' do
    erb(:'peeps/new')
  end

  post '/peeps/new' do
    Peep.create(content: params['content'])
    redirect '/peeps'
  end
end
