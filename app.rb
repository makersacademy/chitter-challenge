require 'sinatra/base'
require 'sinatra/flash'
require './lib/peep.rb'
require './lib/user.rb'

require_relative 'database_connection_setup'

class Chitter < Sinatra::Base

  enable :sessions

  register Sinatra::Flash

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    @user = User.find(id: session[:user_id])
    erb(:peeps)
  end

  post '/peeps' do
    Peep.create(message: params[:message], user_id: session[:user_id])
    redirect '/peeps'
  end

  get '/peeps/new' do
    erb(:'peeps/new')
  end

  get '/users/new' do
    erb(:'users/new')
  end

  post '/users' do
    user = User.create(
      email: params[:email], password: params[:password], 
      name: params[:name], username: params[:username]
    )
    session[:user_id] = user.id
    redirect '/peeps'
  end

  get '/sessions/new' do
    erb(:'sessions/new')
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect '/peeps'
    else
      flash[:notice] = 
      'The email and password that you entered did not match our records. 
      Please double-check and try again.'
      redirect '/sessions/new'
    end
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'Successfully signed out'
    redirect('/peeps')
  end

  run! if app_file == $0
end
