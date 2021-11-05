require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/reloader'
require_relative './lib/peep.rb'
require_relative './lib/comment.rb'
require_relative './lib/user.rb'

require './database_connection_setup'


class ChitterChallenge < Sinatra::Base

  enable :sessions, :method_override
  configure :development, :test do
    register Sinatra::Reloader
    register Sinatra::Flash
  end
    

  get '/' do
    "All chitter peeps"
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
    Peep.create(peep: params['peep']);
    redirect '/peeps'
  end

  delete '/peeps/:id' do
    Peep.delete(id: params[:id])
    redirect '/peeps'
  end

  get '/peeps/:id/edit' do
    @peep = Peep.find(id: params[:id])
    erb :'peeps/edit'
  end
  
  patch '/peeps/:id' do
    Peep.update(id: params[:id], peep: params[:peep])
    redirect('/peeps')
  end

  get '/peeps/:id/comments/new' do
    @peep_id = params[:id]
    erb :'comments/new'
  end

  post '/peeps/:id/comments' do
    Comment.create(peep_id: params[:id], text: params[:comment])
    redirect '/peeps'
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    user = User.create(email: params['email'], password: params['password'])
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

  run! if app_file == $0
end
