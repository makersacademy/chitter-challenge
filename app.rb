require 'sinatra/base'
require 'pg'

require_relative './spec/setup_test_database.rb'
require_relative './lib/peep.rb'
require_relative './lib/user.rb'

# require_relative

class Chitter < Sinatra::Base
  enable :method_override, :sessions

  get '/' do
    erb :index
  end 

  get '/peeps' do
    @peeps = Peep.all
    @user = User.find(id: session[:user_id])
    erb :peeps
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end 

  post '/peeps' do
    Peep.post(content: params['content'], name: params['name'])
    redirect '/peeps'
  end 

  get '/users/new' do
    erb :'users/new'
  end 

  post '/users' do 
    @user = User.add(email: params[:email], password: params[:password], username: params[:username])
    session[:user_id] = @user.id
    p @user.username
    redirect '/peeps'
  end 

  get '/sessions/new' do 
    erb :'sessions/new'
  end 

  post '/sessions' do 
    session[:user_id] = @user.id
    # authenticate
    redirect '/peeps'
  end 

  run! if app_file == $0

end
