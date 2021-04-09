require 'sinatra/base'
require_relative './lib/peep'
require_relative './lib/comment'
require_relative './lib/user'
require_relative './database_connection_setup'

class PeepManager < Sinatra::Base

  enable :sessions, :method_override

  get '/' do
    erb :index
  end

  get '/peeps' do
    @user = User.find(session[:user_id])
    @peeps = Peep.all
    erb :peeps
  end

  get '/peeps/new' do
    erb :peeps_new
  end

  get '/peeps/:id/edit' do
    @peep = Peep.find(id: params[:id])
    erb :'peeps_edit'
  end

  post '/peeps' do
    Peep.create(peep: params[:peep])
    redirect '/peeps'
  end

  delete '/peeps/:id' do
    Peep.delete(id: params[:id])
    redirect '/peeps'
  end

  patch '/peeps/:id' do
    Peep.update(id: params[:id], peep: params[:peep])
    redirect '/peeps'
  end

  get '/peeps/:id/comments/new' do
    @peep_id = params[:id]
    erb :'comments'
  end

  post '/peeps/:id/comments' do
    Comment.create(peep_id: params[:id], text: params[:comment])
    redirect '/peeps'
  end

  get '/users/new' do
    erb :users_new
  end

  post '/users' do
    user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/peeps'
  end

  run! if app_file == $0

end
