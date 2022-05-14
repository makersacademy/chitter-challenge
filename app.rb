require 'sinatra/base'
require 'sinatra/flash'

require_relative './lib/peep'
require_relative './lib/user'
require_relative './database_connection_setup'

class Chitter < Sinatra::Base
  register Sinatra::Flash
  enable :sessions, :method_override

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @user = User.find(id: session[:user_id])
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(body: params[:body])
    redirect '/peeps'
  end

  get '/users/new' do
    erb :"users/new"
  end 

  post '/users' do
    user = User.create(
      email: params[:email],
      password: params[:password],
      name: params[:name],
      username: params[:username]
    )
    session[:user_id] = user.id
    redirect '/peeps'
  end
end