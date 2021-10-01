require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep'
require './lib/user'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions

  get '/' do
    @username = session[:user].username
    erb(:index)
  end

  get '/peeps/new' do
    @user_id = session[:user].id
    if @user_id 
      erb(:new_peep)
    else
      redirect to('/')
    end
  end

  post '/peeps' do
    Peep.create(name: session[:user].username, content: params[:content], user_id: session[:user].id)
    redirect to('/')
  end

  get '/users/new' do
    erb(:new_user)
  end

  post '/users' do
    user = User.create(username: params[:user_name], email: params[:email], password: params[:password])
    p user
    session[:user] = user
    redirect to('/')
  end
end
