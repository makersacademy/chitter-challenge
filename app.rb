require 'sinatra'
require 'sinatra/flash'
require './lib/peep'
require './lib/user'
require 'pg'

class Chitter < Sinatra::Base
enable :sessions
register Sinatra::Flash

  get '/' do
    "Hello, this is my first peep"
  end

  get '/chitter' do
    @peeps = Peep.all_peeps
    @users = User.all_users
    erb(:index)
  end

  post '/chitter' do
    Peep.create_peep(content: params[:content])
    redirect('/chitter')
  end

  get '/chitter/users' do
    erb(:newuser)
  end

  post '/chitter/newuser' do
    flash[:notice] =  "You have signed up!" if User.create_user(params[:username], params[:password])
    redirect('/chitter')
  end

  get '/chitter/sessions/new' do
    erb(:sessions)
  end

  post '/chitter/sessions/new' do
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'peep_manager_test')
    else
    connection = PG.connect(dbname: 'peep_manager')
  end
    result = connection.exec("SELECT * FROM users WHERE username = '#{params[:username]}' AND password = '#{params[:password]}'")
    user = User.new(result[0]['username'], result[0]['password'])
    session[:user_username] = user.username
    redirect('/chitter')
end

  post '/chitter/logout' do
    session[:user_username] = nil
    redirect('/chitter')
  end
  run! if app_file == $0
end
