require './lib/peep'
require './lib/user'

require 'bcrypt'
require 'pg'
require 'sinatra/base'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    @user = User.get(session[:id])
    @peeps = Peep.all(:order => [ :id.desc ])
    erb(:index)
  end

  get '/users/new' do
    erb(:'users/new')
  end

  post '/users' do
    user = User.create(
      peeper: params['name'],
      username: params['username'],
      email: params['email'],
      password: BCrypt::Password.create(params['password'])
    )

    if user.errors.size > 0
      flash[:errors] = user.errors.first
      redirect '/users/new'
    end

    session[:id] = user.id
    redirect '/'
  end

  get '/sessions/new' do
    erb(:'sessions/new')
  end

  post '/sessions' do
    user = User.first(:email => params['email'])

    session[:id] = user.id
    redirect '/'
  end

  get '/logout' do
    session.delete(:id)
    redirect '/'
  end

  run! if app_file == $0
end
