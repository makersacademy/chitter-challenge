require 'sinatra/base'
require 'pg'
require './lib/peep'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    erb :'peeps/index'
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    session[:current_user] = params[:username]
    redirect '/peeps'
  end

  get '/peeps' do
    @user_name = session[:current_user]
    @peeps = Peep.all.reverse
    erb :'peeps/feed'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps/new' do
    Peep.create(comment: params["comment"])
    redirect '/peeps'
  end
end
