require 'sinatra/base'
require './lib/peep'
require './lib/user'
require './database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions

  get '/peeps' do
    @user = !session[:user_id].nil? ? User.find(id: session[:user_id]) : nil
    @peeps = Peep.all
    erb(:'peeps/index')
  end

  get '/peeps/new' do
    erb(:'peeps/new')
  end

  post '/peeps/new' do
    Peep.send(message: params[:message])

    redirect('/peeps')
  end

  get '/users/new' do
    erb(:'users/new')
  end

  post '/users' do
    user = User.create(\
      email: params[:email], \
      password: params[:password], \
      name: params[:name], \
      username: params[:username]
    )

    session[:user_id] = user.id

    redirect('/peeps')
  end

  run! if app_file == $0
end
