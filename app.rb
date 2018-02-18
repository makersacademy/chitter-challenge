require 'sinatra/base'
require './lib/peep'
require './lib/database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    redirect '/peeps'
  end

  get '/users/new' do
    erb(:sign_up)
  end

  post '/users' do
    user = User.create(params)
    session[:user_id] = user.id
    redirect '/'
  end

  get '/peeps' do
    @user = User.find(session[:user_id])
    @peeps = Peep.all
    erb(:index)
  end

  get '/peeps/new' do
    erb(:create)
  end

  post '/peeps' do
    p params
    Peep.create(params)
    redirect '/'
  end

  # get '/new' do
  #   erb(:new)
  # end
  #
  # post "/" do
  #   Peep.create(peep: params[:peep], title: params[:title])
  #   redirect("/")
  # end
  #
  # run! if app_file == $0
end
