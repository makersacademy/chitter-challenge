require 'sinatra/base'
require './lib/peep'
require './lib/user'

class Chitter < Sinatra::Base

  set :port, 6789

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @user = User.current
    @peeps = Peep.all
    erb(:"peeps/index")
  end

  get '/peeps/new' do
    erb(:"peeps/new")
  end

  post '/peeps' do
    Peep.create(username: User.current.username, content: params[:content])
    redirect '/peeps'
  end

  get '/peeps/:id/edit' do
    @peep = Peep.find(params[:id])
    erb(:"peeps/edit")
  end

  patch '/peeps/:id' do
    Peep.change(params[:id], params[:content])
    redirect '/peeps'
  end

  delete '/peeps/:id' do
    Peep.delete(params[:id])
    redirect '/peeps'
  end

  get '/users/new' do
    erb(:"users/new")
  end

  post '/users' do
    User.create(
      username: params[:username],
      password: params[:password],
      name: params[:name],
      email: params[:email]
    )
    redirect '/peeps'
  end

  get '/sessions/new' do
    erb(:"sessions/new")
  end

  post '/sessions' do
    User.login(
      username: params[:username],
      password: params[:password]
    )
    redirect '/peeps'
  end

  run! if app_file == $0
end
