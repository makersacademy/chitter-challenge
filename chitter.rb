require 'sinatra'
require 'sinatra/flash'

require_relative 'lib/database_connection'
require_relative 'lib/user'
require_relative 'lib/peep'

class Chitter < Sinatra::Base
  before { @user = User.find(id: session[:id]) if session[:id] }

  configure do
    register Sinatra::Flash
    enable :sessions, :method_override
    set :session_secret, ENV['SESSION_SECRET']
  end

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(content: params[:peep], user_id: session[:id])
    redirect '/peeps'
  end

  get '/peeps/:id/edit' do
    @peep = Peep.find(id: params[:id])
    erb :'peeps/edit'
  end

  patch '/peeps/:id' do
    Peep.update(id: params[:id], content: params[:peep])
    redirect "/users/:id/peeps"
  end

  delete '/peeps/:id' do
    Peep.delete(id: params[:id])
    redirect '/users/:id/peeps'
  end

  get '/users/:id/show' do
    erb :'users/index'
  end

  get '/users/:id/edit' do
    erb :'users/edit'
  end

  patch '/users/:id' do
    User.update(id: params[:id], name: params[:name],
      username: params[:username], email: params[:email])
    redirect '/users/:id/show'
  end

  get '/users/delete' do
    erb :'users/delete'
  end

  delete '/users/:id/delete' do
    User.delete(id: params[:id])
    session.clear
    flash[:notice] = 'Your account has been deleted.'
    redirect '/peeps'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(name: params[:name], email: params[:email],
      username: params[:username], password: params[:password])

    session[:id] = user.id
    redirect '/peeps'
  end

  get '/users/:id/peeps' do
    @peeps = Peep.my_peeps(user_id: @user.id)
    erb :'users/peeps'
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(username: params[:username],
      password: params[:password])

    if user
      session[:id] = user.id
      redirect '/peeps'
    else
      flash[:notice] = 'Incorrect login details, please try again.'
      redirect '/sessions/new'
    end
  end

  delete '/sessions/:id' do
    session.clear
    flash[:notice] = 'You have signed out.'
    redirect '/peeps'
  end

  run! if app_file == $PROGRAM_NAME
end
