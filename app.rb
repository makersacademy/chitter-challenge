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

  run! if app_file == $0
end
