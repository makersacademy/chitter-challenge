require 'sinatra/base'
require 'pg'
require './lib/peep'
require './lib/user'

class ChitterApp < Sinatra::Base

  enable :sessions, :method_override

  get '/' do
    @user = User.find(session[:user_id])
    @feed = Peep.all.reverse
    erb :feed
  end


  get '/feed/new' do
    erb :feed_new
  end


  post '/new' do
    Peep.add(content: params[:content])
    redirect '/'
  end

  get '/users/new' do
    erb :user_new
  end

  post '/users' do
    user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/'
  end

end
