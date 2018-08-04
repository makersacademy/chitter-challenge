require 'sinatra/base'
require './lib/user_posts'
require './lib/New_user'
require './database_connection_setup'

class Chitter < Sinatra::Base
enable 'sessions'

  get '/' do
    erb(:index)
  end

  get '/user' do
    @user = New_user.find(session[:user_id])
    @all_posts = User.all
    erb(:user)
  end

  post '/user' do
    User.create(content: params['new_post'])
    redirect '/user'
  end

  get '/user/new' do
    erb(:new_user)
  end

  post '/users' do
    New_user.create(username: params['username'], email: params['email'], password: params['password'])
    redirect '/user' #is this right?
  end

  run! if app_file == $0
end
