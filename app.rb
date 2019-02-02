require 'sinatra/base'
require 'shotgun'
require 'pg'

class Chitter < Sinatra::Base
enable :sessions

  get '/' do
    'Welcome to CHITTER!'
  end

  get '/users' do
    @users = User.all
    # connection = PG.connect(dbname: 'chitter_test')
    # data = connection.exec("SELECT * FROM users")
    # @result = data.map {|user| user }
    erb :'users/index'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    User.create(name: params[:name], email: params[:email], username: params[:username], password: params[:password])

    redirect '/users'
  end

end
