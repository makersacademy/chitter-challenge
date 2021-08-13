# HARDER User Stories:
# If signed in, don't give "Sign Up" or "Sign In" options
# Make sure paths flow and edit CSS

require 'sinatra/base'
require 'sinatra/flash'
require_relative './lib/user.rb'
require_relative './database_connection.rb'

class Chitter < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  before do
    @user = User.find(session[:user_id]) unless session[:user_id].nil?
  end

  get '/' do
    erb :index
  end

  get '/peeps' do
    @peeps = Peep.all.order(created_at: :desc)
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/save_peep' do
    peep = @user.peeps.create(params[:peep])
    peep.tags.create(user_id: params[:tag_user]) unless params[:tag_user] == "nil"
    redirect '/peeps'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/save_user' do
    duplicate = User.check_duplicate(params[:user])
    if duplicate.nil?
      user = User.create(params[:user])
      session[:user_id] = user.id
      redirect "/users/#{user.id}/welcome"
    else
      flash[:notice] = duplicate
      redirect '/users/new'
    end
  end

  get '/users/:id/welcome' do
    erb :'users/welcome'
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.find_by(username: params[:username])&.authenticate(params[:password])
    if user
      session[:user_id] = user.id
      redirect '/peeps'
    else
      flash[:notice] = 'Username or password incorrect. Please try again.'
      redirect '/sessions/new'
    end
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have signed out'
    redirect '/peeps'
  end

  run! if app_file == $0
end
