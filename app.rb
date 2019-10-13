require 'sinatra/base'
require 'sinatra/flash'
require './lib/peep'
require './lib/user'
require './spec/database_connection_setup'
require 'date'

class Chitter < Sinatra::Base

  enable :method_override, :sessions
  register Sinatra::Flash

  get '/' do
    redirect "/user/#{User.logged_in.user_name}" if User.logged_in  
    @peeps = Peep.all_in_order
    erb :index
  end

  get '/user/new' do
    erb :'user/new'
  end

  post '/user' do
    User.create(user_name:params['user_name'], email:params['email'], password:params['password'])
    if User.error == nil
      redirect "/user/#{User.logged_in.user_name}"
    elsif User.error == 'user_name'
      flash[:notice] = "Username taken"
      redirect '/user/new'
    elsif User.error == 'email'
      flash[:notice] = "Email already in use"
      redirect '/user/new'
    else
      flash[:notice] = "Fill in all fields"
      redirect '/user/new'
    end
  end

  get '/user/login' do
    erb :'user/login'
  end

  post '/user/login' do
    user = User.login(user_name:params['user_name'], password:params['password'])
    if User.logged_in
      redirect "/user/#{user.user_name}"
    else 
      flash[:notice] = "Incorrect details try again"
      redirect '/user/login'
    end
  end

  get '/user/logout' do
    User.logout
    redirect '/'
  end

  get '/user/:name' do
    @peeps = Peep.all_in_order
    @user = User.logged_in
    erb :'user/index'
  end

  post '/peep' do
    if User.logged_in != nil
      Peep.create(message:params['peep'])
      redirect "/user/#{User.logged_in.user_name}"
    else
      flash[:notice] = "Not logged in, please login or sign up"
      redirect '/'
    end
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
