require 'sinatra/base'
require './lib/peep'
require './lib/user'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do 
    @user = User.find(session[:user_id])
    @bookmarks = Bookmark.all
    erb :index
  end

  get '/create_peep' do
    erb :new_peep
  end

  post '/submit_peep' do
    @time_stamp = Time.now
    boo= Peep.create(peep: params['peep'], time_stamp: @time_stamp)
    redirect '/view_peeps'
  end

  get '/view_peeps' do
    @user = User.find(session[:user_id])
    @peeps = Peep.all
    erb :view_peeps
  end

  get 'users' do
    erb :users
  end

  post '/users' do
    user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/view_peeps'
  end
end