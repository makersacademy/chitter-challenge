require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/reloader'
require 'uri'
require './lib/user'
require './lib/peep'
require './database_connection_setup'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    also_reload './lib/peep'
    also_reload './lib/user'
  end

  enable :sessions
  register Sinatra::Flash

  get '/peeps' do
    @user = User.find(session[:user_id])
    @peeps = Peep.show
    erb(:peeps)
  end

  post '/peeps' do
    Peep.create(params[:peep])
    redirect '/peeps'
  end

  get '/users/new' do
    erb(:'users/new')
  end

  post '/users' do
    user = User.create(
      name: params[:name], username: params[:username], 
      email: params[:email], password: params[:password]
    )
    session[:user_id] = user.id
    redirect './peeps'
  end

  get '/sessions/new' do
    erb(:'sessions/new')
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])

    if user
      session[:user_id] = user.id
      redirect('/peeps')
    else
      flash[:notice] = "Something wasn't right! Try again..."
      redirect '/sessions/new' 
    end
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'Bye for now. Come back soon!'
    redirect '/peeps'
  end
end
