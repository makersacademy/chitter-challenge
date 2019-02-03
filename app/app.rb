require 'pg'
require 'sinatra/base'
require_relative './lib/peep'
require_relative './lib/user'

class Chitter < Sinatra::Base
  
  enable :sessions, :method_override

  get '/' do
    @peeps = Peep.all
    @user = User.find(id: session[:user_id])
    erb :index
  end

  post '/process-peep' do
    Peep.create(peep: params[:peep])
    redirect '/'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/'
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    # connection = PG.connect(dbname: 'chitter')
    # result = connection.exec("SELECT * FROM users WHERE email = '#{params[:email]}'")
    # user = User.new(result[0]['id'], result[0]['email'], result[0]['password'])
    # session[:user_id] = user.id
    redirect ('/')
  end

  run! if app_file == $0
end
