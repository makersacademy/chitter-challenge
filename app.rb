require 'sinatra/base'
require 'sinatra/flash'
require './database_connection_setup'
require './lib/database_connection'
require './lib/peep.rb'
require './lib/user.rb'
require './lib/comment.rb'


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
    @user = session[:user_id]
    erb :"sessions/index"
  end

  get '/peeps/add' do
    erb :"peeps/add"
  end

  post '/peeps/add' do
    Peep.add(params, session[:user_id])
    redirect ('/sessions/peeps')
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    if User.in_base?(params)
      flash[:notice] = 'Username or email already taken!'
      redirect ('/users/new')
    else
      user = User.create(params)
      session[:user_id] = user
      redirect ('/sessions/peeps')
    end
  end

  get '/sessions/new' do
    erb :"sessions/new"
  end

  post '/sessions' do
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

  get '/comments/:id/new' do
    @user = session[:user_id]
    @peep_id = params[:peep_id]
    @peep = Peep.find(@peep_id)
    erb :"comments/new"
  end

  post '/comments/:id/new' do
    @peep = params[:peep_id]
    Comment.add(@peep, params, session[:user_id])
    redirect ('/sessions/peeps')
  end
end
