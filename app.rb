require 'sinatra/base'
require './lib/peep'
require './lib/user'

class Chitter < Sinatra::Base

  get '/' do
    "Chitter"
  end

  get '/users/new' do
    erb :'users/new'
  end

  get '/peeps' do
    @peeps = Peep.all
    @user = User.instance
    erb :'peeps/index'
  end

  get '/peeps/:user_id/new' do
    # @user_id = params[:user_id]
    @user = User.instance

    erb :'peeps/new'

  end

  post '/peeps/:user_id' do
    @user_id = params[:user_id]
    Peep.create(user_id: @user_id, text: params[:peep])
    redirect '/peeps'
  end

  post '/users' do
    @user = User.create(email: params[:email], password: params[:password], name: params[:name], username: params[:username])
    redirect '/peeps'
  end

  run! if app_file == $0
end
