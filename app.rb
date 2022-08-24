require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/peep'
require_relative './lib/user'


class ChitterApp < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions

  get '/' do
    redirect '/peeps'
  end

  get '/peeps/new' do
    erb :"peeps/new"
  end

  post '/peeps' do
    Peep.create(content: params[:content])
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/users/sign_up' do
    erb:"users/sign_up"
  end

  post '/users/sign_up' do
    @user = User.create(
      username: params[:username], email: params[:email], password: params[:password]
    )
    session[:username] = @user.username
    erb :"users/user_homepage"
  end

  get '/users/log_in' do
    erb :"users/log_in"
  end

  post '/users/log_in' do
     @user = User.authenticate(
      email: params[:email], password: params[:password]
    )
    if @user
      session[:user_id] = @user.id
      redirect '/peeps'
    else
      redirect ('/users/log_in')
    end
  end

  run! if app_file == $0
end

