require 'sinatra/base'
require 'pg'
require_relative 'lib/user'
require_relative 'lib/peep'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    @user = session['user']
    erb(:index)
  end

  get '/signup' do
    erb(:signup)
  end

  post '/new-user' do
    session['user'] = User.create(params[:name], params[:email], params[:handle], params[:password])
    redirect '/'
  end

  get '/peeps/new' do
    erb(:'peeps/new')
  end

  post '/peeps/new-peep' do
    @user = session['user']
    Peep.create(params[:message], @user.handle, @user.name)
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb(:'peeps/index')
  end

  run! if app_file == $0
end
