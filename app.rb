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
    @peeps = Peep.all_in_order
    erb :index
  end

  get '/user/new' do
    erb :'user/new'
  end

  post '/user' do
    user = User.create(user_name:params['user_name'], email:params['email'], password:params['password'])
    redirect "/user/#{user.id}"
  end

  get '/user/:id' do
    @peeps = Peep.all_in_order
    @user = User.logged_in
    erb :'user/index'
  end

  post '/peep' do
    if User.logged_in != nil
      Peep.create(message:params['peep'])
      user = User.logged_in
      redirect "/user/#{user.id}"
    else
      flash[:notice] = "Not logged in, please login or sign up"
      redirect '/'
    end
    
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
