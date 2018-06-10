require 'sinatra/base'
require './lib/peep'
require './lib/user'
require 'sinatra/flash'
require 'pry'
require 'shotgun'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  get '/peeps/show' do
    @user = User.find(session[:user_id])
    @peeps = Peep.all
    erb :"peeps/show"
  end

  get '/peeps/new' do
    @user = User.find(session[:user_id])
    erb :"peeps/new"
  end

  post '/peeps/new' do
    flash[:notice] = "Your peep must be 280 characters or less" unless Peep.create(text: params['text'], username: params['username'])
    redirect '/peeps/show'
  end

  post '/peeps/:id/delete' do
    Peep.delete(params['id'])
    redirect '/peeps/show'
  end

  post '/peeps/edit1' do
    Peep.edit(id: params['id'], text: params['text'], username: params['username'])
    redirect '/peeps/show'
  end

  get '/peeps/edit' do
    @peep = Peep.find(params[:id])
    erb :"/peeps/edit"
  end

  post '/users/new1' do
    user = User.create(username: params['username'], name: params['name'], email: params['email'], password: params['password'])
    session[:user_id] = user.id
    redirect 'peeps/show'
  end

  run! if app_file ==$0
end
