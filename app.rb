require 'sinatra/base'
require 'sinatra/flash'
require './lib/peep'
require_relative './database_connection_setup'
require 'uri'
require './lib/comment'
require './lib/user'

class Chitter < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  get '/peeps' do
    @user = User.find(id: session[:user_id])
    if session[:user_id].nil? 
      redirect '/'
    else
      @peeps = Peep.all
      erb :'peeps/index'
    end
    
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(text: params['text'], user_id: session[:user_id])
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
    Peep.update(id: params[:id], text: params[:text])
    redirect '/peeps'
  end

  get '/peeps/:id/comments/new' do
    @peep_id = params[:id]
    erb :'comments/new'
  end

  post '/peeps/:id/comments' do
    Comment.create(text: params[:comment], peep_id: params[:id])
    redirect '/peeps'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(email: params[:email], password: params[:password])
    if user.instance_of? Symbol
      err1 = "Error: email already taken!"
      err2 = "You must enter a valid email address!"
      flash[:non_unique_details] = err1 if user == :non_unique_email
      flash[:non_unique_details] = err2 if user == :invalid_email
      redirect '/users/new'
    end
    session[:user_id] = user.id
    redirect '/peeps'
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])

    if user
      session[:user_id] = user.id
      redirect '/peeps'
    else
      flash[:notice] = 'Please check your email or password'
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
