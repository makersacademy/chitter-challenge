require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/reloader'
require './lib/peep'
require './lib/user'
require_relative './database_connection_setup.rb'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

enable :sessions, :method_override # we use the session to persist data across the routes and redirects
register Sinatra::Flash

  get '/sessions/new' do # login page
    erb:'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(username: params[:username], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect '/peeps'
    else
      flash[:notice] = 'This user does not exist. Please check your email or password.'
      redirect '/sessions/new'
    end
  end

  post '/sessions/destroy' do 
    session.clear
    flash[:notice] = 'You have signed out.'
    redirect '/peeps'
  end
  
  get '/' do # p 'sign up'
    session[:user_id] = nil
    erb :'users/new'
  end

  post '/' do 
    p 'info submitted through sign up form at homepage '
    user = User.create(
      username: params[:username],
      handle: params[:handle],
      password: params[:password]
      ) #returns User.new, a ruby-wrapped db object with an id from db
    session[:user_id] = user.id #user_id stored in the session so we can grab it at get '.peeps'
    redirect '/peeps'
  end

  get '/peeps' do
    p 'peeps page with post a peep form '
    session[:user_id] #this relies on sign-up at '/' first otherwise this would be nil
    @user = User.find(id: session[:user_id]) # Fetch the user from the database, using an ID stored in the session. This way, we avoid storing the entire user in the session (partly because the session is v small and can't store much data)
    @peeps = Peep.sort_all_peeps 
     
    erb :'peeps/index'
  end

  post '/peeps' do # post a peep form which is on the same page as page displaying peeps ('peeps/index')
    params
    @user = User.find(id: session[:user_id])
    
    @user.nil? ? id = nil : id = @user.id
    Peep.add(params[:peep], id)
    redirect '/peeps' 
  end

  delete '/peeps/:id' do 
    p params[:id]
    Peep.delete(id: params[:id])
    redirect '/peeps'
  end
 
  run! if app_file == $0
end