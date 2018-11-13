require 'sinatra/base'
require 'sinatra/flash'
require './lib/peep'
require_relative './database_connection_setup'
require 'uri'
require './lib/comment'
require './lib/user'

class Chitter < Sinatra::Base
  enable :sessions, :method_override

  get '/' do
    erb :index
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
    Peep.create(text: params['text'])
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
    session[:user_id] = user.id
    redirect '/peeps'
  end

  run! if app_file == $0
end
