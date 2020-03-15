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

  post '/users' do
    @user = User.create(email: params[:email], password: params[:password], name: params[:name], username: params[:username])
    redirect '/peeps'
  end

  run! if app_file == $0
end
