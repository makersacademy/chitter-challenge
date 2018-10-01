require 'sinatra/base'
require './lib/peep.rb'
require './lib/user.rb'
require 'sinatra/flash'
require 'time_difference'
# require_relative './lib/database_connection.rb'

class Chitter < Sinatra::Application
  enable :sessions
  register Sinatra::Flash

  before do
    @user = User.instance
  end

  get '/' do
    erb :index
  end

  get '/users/new' do
    erb :'/users/new'
  end

  post '/users' do
    user = User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    session[:username] = user.username
    redirect '/sessions/new'
  end

  get '/sessions/new' do
    erb :'/sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])
    if user
      session[:user_id] = user.id
      session[:username] = user.username
      @username = session[:username]
      redirect('/peeps/index')
    else
      flash[:notice] = 'Please check your email or password.'
      redirect('/sessions/new')
    end
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have signed out.'
    redirect('/peeps/index')
  end

  get '/peeps/index' do
    @username = session[:username]
    @peeps = Peep.all
    erb :'/peeps/index'
  end

  post '/peeps' do
    Peep.create(params[:message])
    redirect '/peeps/index'
  end

  run! if app_file == $0

end
