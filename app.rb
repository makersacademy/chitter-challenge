require 'sinatra/base'
require 'pg'
require_relative "./lib/peep"
require_relative "./lib/user"
require_relative "./database_setup"


class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  get '/peeps' do
    redirect to('/') unless session[:user]
    @user = session[:user]
    @peeps = Peep.all
    erb :peep
  end

  post '/peeps' do
    Peep.create(params[:peep])
    redirect to '/peeps'
  end

  get '/new_user' do
    erb :new_user
  end

  post '/users' do
    session[:user] = User.create(params)
    redirect to '/peeps'
  end
end
