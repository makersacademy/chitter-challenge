require 'sinatra/base'
require_relative './data_mapper_setup'

class Chitter < Sinatra::Base

  set :views, proc {File.join(root, '/app/views')}
  enable :sessions

  helpers do
    def current_user
      User.get(session[:user_id])
    end
  end

  get '/' do
    'Hello Chitter!'
  end

  get '/users/new' do
    erb :'/users/new'
  end

  post '/users' do
    @user = User.create(email: params[:email], password: params[:password], name: params[:name], user_name: params[:user_name])
    session[:user_id] = @user.id
    redirect '/peeps'
  end

  get '/peeps' do
    erb :'peeps/index'
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/peeps')
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
