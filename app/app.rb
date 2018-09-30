require 'sinatra/base'
require './app/models/peep'
require './app/models/user'
require './database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    'welcome to Chitter'
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
    p session[:user_id]
    redirect('/peeps')
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    # p 'form submitted'
    Peep.create(peep: params['peep_text'], time: DateTime.now.to_s)
    redirect '/peeps'
  end

  get '/peeps' do
    # Fetch the user from the database, using an ID stored in the session
    p session[:user_id]
    @user = User.find(session[:user_id])
    p @user
    @peeps = Peep.all
    erb(:peeps)
  end
  run! if app_file == $0
end
