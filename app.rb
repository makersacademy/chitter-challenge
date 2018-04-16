require 'sinatra/base'
require 'sinatra/flash'
require './database_connection_setup'
require './lib/database_connection'
require './lib/peep.rb'
require './lib/user.rb'


class ChitterApp < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    redirect ('/peeps')
  end

  get '/peeps' do
    erb :"peeps/index"
  end

  get '/sessions/peeps' do
    erb :"sessions/index"
  end

  get '/peeps/add' do
    erb :"peeps/add"
  end

  post '/peeps/add' do
    Peep.add(params, session[:user_id])
    redirect ('/')
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    user = User.create(params)
    session[:user_id] = user
    redirect ('/sessions/peeps')
  end

  get '/sessions/new' do
    erb :"sessions/new"
  end

  post '/sessions/' do
    user = User.authenticate(params['email'], params['password'])
    if user
      session[:user_id] = user
      redirect('/sessions/peeps')
    else
      flash[:notice] = 'Wrong email or password.'
      redirect('/sessions/new')
    end
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have signed out.'
    redirect('/')
  end

end
