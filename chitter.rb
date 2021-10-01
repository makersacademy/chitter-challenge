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
    @username = session[:username]
    erb(:index)
  end

  get '/peeps/new' do
    @username = session[:username]
    if @username 
      erb(:new_peep)
    else
      redirect to('/')
    end
  end

  post '/peeps' do
    Peep.create(name: session[:username], content: params[:content])
    redirect to('/')
  end

  get '/users/new' do
    erb(:new_user)
  end

  post '/users' do
    user = User.create(username: params[:user_name], email: params[:email], password: params[:password])
    session[:username] = user.username
    redirect to('/')
  end
end
