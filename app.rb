require './lib/peep'
require './lib/user'

require 'pg'
require 'sinatra/base'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    # We fetch the user from the database using the ORM
    # ID is stored in the session ('/users')
    @user = User.get(session[:id])
    @peeps = Peep.all
    erb(:index)
  end

  get '/users/new' do
    erb(:'users/new')
  end

  post '/users' do
    user = User.create(peeper: params['name'], username: params['username'], email: params['email'], password: params['password'])
    session[:id] = user.id
    redirect '/'
  end

  run! if app_file == $0
end
