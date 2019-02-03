require 'sinatra/base'
require './lib/peeps'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  get '/peeps' do
    @user = User.find(session:[:user_id])
    @peeps = Peeps.all
    erb :peeps
  end

  get '/new' do
    erb :new
  end

  post '/peeps' do
    Peeps.create(peep: params['peep'])
    redirect '/peeps'
  end

  get '/new_account' do
    erb :new_account
  end

  post '/users' do
    user = User.create(email: params[:email],
      password: params[:password],
      name: params[:name],
      username: params[:username])
    session[:user_id] = user.id
    redirect '/peeps'
  end

  run! if app_file == $0
end
