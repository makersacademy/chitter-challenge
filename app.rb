require 'pg'
require 'uri'
require 'sinatra/base'
require 'sinatra/flash'
require './lib/chitter'
require './lib/user'
require './database_connection_setup'

class Chitter < Sinatra::Base

  enable :sessions, :method_override
  register Sinatra::Flash

  get '/' do
    erb :'index'
  end


  get '/login' do
    erb :'login'
  end

  post '/login_user' do
    session['user'] = User.find(id: params[:id])
    redirect '/peeps'
  end

  get '/signup' do
    erb :'signup'
  end

  post '/user_new' do
    session['user'] = User.create(email: params[:email], password: params[:password], name: params[:name], username: params[:username])
    redirect '/peeps'
  end

  get '/peeps' do
    @user = session['user']
    @peeps = Peep.all
    erb :'peeps'
  end

  post '/peep_new' do
    session['peep'] = Peep.create(create(message: params[:message], username_id: params[:id]))
    redirect '/peeps'
  end

  run! if app_file == $0

end
