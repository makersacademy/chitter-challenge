require 'sinatra/base'
require './lib/peep.rb'
require './lib/user.rb'

require_relative 'database_connection_setup'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    @user = User.find(id: session[:user_id])
    erb(:peeps)
  end

  post '/peeps' do
    Peep.create(params[:message])
    redirect '/peeps'
  end

  get '/peeps/new' do
    erb(:'peeps/new')
  end

  get '/users/new' do
    erb(:'users/new')
  end

  post '/users' do
    user = User.create(
      email: params[:email], password: params[:password], 
      name: params[:name], username: params[:username]
    )
    session[:user_id] = user.id
    redirect '/peeps'
  end

  run! if app_file == $0
end
