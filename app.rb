require 'sinatra/base'
require './lib/peep'

class ChitterApp < Sinatra::Base
  enable :sessions
  
  get '/' do
    @user = session[:username]
    erb :index
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  post '/peeps' do
    Peep.create(text: params[:text])
    redirect '/peeps'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/users' do
    User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    session[:username] = User.all.first.username
    redirect '/'
  end

  get '/users/new' do
    erb :'users/new'
  end



end