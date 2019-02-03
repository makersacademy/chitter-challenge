require 'sinatra/base'
require 'shotgun'
require 'pg'
require './lib/user.rb'
require './lib/peep.rb'

class Chitter < Sinatra::Base

enable :sessions, :method_override

  get '/' do
    'Welcome to CHITTER!'
  end

  get '/users' do
    @users = User.all
    erb :'users/index'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    User.create(name: params[:name], email: params[:email], username: params[:username], password: params[:password])

    redirect '/users'
  end

  get '/peeps' do
    @username = $username
    @peep = $peep
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    $username = params[:username]
    $peep = params[:peep]

    redirect '/peeps'
  end

  run! if app_file == $0

end
