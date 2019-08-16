require 'sinatra/base'
require './lib/peep'
require './database_connection_setup'
require './lib/user'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    @peeps = Peep.all
    @user = User.find(id: session[:user_id])
    erb :'peeps/index'
  end

  post '/' do
    Peep.create(content: params['content'])
    # content = params['content']
    # connection = PG.connect(dbname: 'peeps_test')
    # connection.exec("INSERT INTO peeps (peep) VALUES ('#{content}')")
    redirect '/'
  end

  # post '/new-peep-post' do
  #   erb :'peeps/index'
  # end
  get '/signup' do
    erb :'users/signup'
  end

  post '/users' do
    user = User.create(email: params['email'], name: params['name'], username: params['username'], password: params['password'])
    session[:user_id] = user.id
    # session[:username] = user.username
    redirect '/'
  end

  get '/sessions/new' do
    erb :"sessions/new"
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    # result = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{params[:email]}'")
    # user = User.new(id: result[0]['id'], email: result[0]['email'], password: result[0]['password'])
    # session[:user_id] = user.id

    redirect('/')
  end


  run! if app_file == $0
end
