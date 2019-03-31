require 'sinatra/base'
require 'sinatra/flash'
require_relative './database_connection_setup'
require_relative './lib/peep'
require_relative './lib/user'

class Chitter < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get '/chitter' do
    @user = User.find(id: session[:user_id])
    @peeps = Peep.reverse_order
    erb :index
  end

  get '/chitter/new' do
    erb :'peep/new'
  end

  post '/chitter' do
    Peep.create(content: params[:peep_content])
    redirect '/chitter'
  end

  get '/user/new' do
    erb :'user/new'
  end

  post '/user' do
    user = User.create(
      name: params[:name],
      username: params[:username],
      email: params[:email],
      password: params[:password]
    )
    session[:user_id] = user.id
    redirect '/chitter'
  end

  get '/user/sign-in' do
    erb :'user/sign_in'
  end

  post '/sessions' do
    user = User.authenticate(username: params[:username], password: params[:password])

    if user
      session[:user_id] = user.id
      redirect('/chitter')
    else
      flash[:notice] = 'Please check your username or password'
    end
  end

  run! if app_file == $0

end
