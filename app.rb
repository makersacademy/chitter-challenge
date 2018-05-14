require 'sinatra/base'
require 'sinatra/flash'
require 'pg'
require './database_connection_setup'
require './lib/user'
require './lib/peep'
require './lib/database_connection'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    erb(:sign_up)
  end

  post '/users' do
    session[:user] = User.create(
      email: params[:email],
      password: params[:password],
      user_name: params[:user_name],
      name: params[:name]
    )
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all.reverse
    erb(:peeps)
  end

  post '/peeps' do
    @user = session[:user]
    Peep.create(text: params[:form], user_id: @user.id)
    redirect '/peeps'
  end

  post '/sign-out' do
    redirect '/'
  end

  run! if app_file == $0
end
