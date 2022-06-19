require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep'
require './lib/user'


class ChitterApp < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions

  get '/' do
    erb :"users/sign_up"
  end

  post '/users/new' do
    # @user = User.create(params[:username]
    # @user = session[:username]
    session[:username] = params[:username]
    session[:email] = params[:email]
    session[:password] = params[:password]
    redirect '/users/sign_up'
  end

  get '/users/sign_up' do
    User.create(username: params[:username], email: params[:email], password: params[:password])
    # @user = User.create(params[:username])
    erb :"users/user_homepage"
  end 

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/all'
  end 

  get '/peeps/new' do
    erb :"peeps/new"
  end

  post '/peeps' do
    Peep.create(content: params[:content])
    redirect '/peeps'
  end


  run! if app_file == $0
end



