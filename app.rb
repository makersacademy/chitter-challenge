require 'sinatra'
require_relative "lib/peep"
require_relative "lib/user"
require_relative 'database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions, :method_override

  get '/' do
    erb :index
  end

  get '/user/new' do
    erb :new_user
  end

  post '/user' do
    user = User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/peeps'
  end

  get '/peeps' do
    @user = User.find(session[:user_id])
    @peeps = Peep.all.reverse
    erb :peeps
  end

  get '/peeps/new' do
    erb :new
  end

  post '/peeps' do
    Peep.create(params[:message])
    redirect '/peeps'
  end

  get '/sessions/new' do
    erb :new_session
  end

  post '/sessions' do
    result = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{params[:email]}'")
    user = User.new(id: result[0]['id'], name: result[0]['name'], username: result[0]['username'], email: result[0]['email'], password: result[0]['password'])

    session[:user_id] = user.id
    redirect('/peeps')
  end

  run! if app_file == $0
end
