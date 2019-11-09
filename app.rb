require 'sinatra/base'
require 'pg'
require_relative 'lib/user'

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
    session['peep'] = params['message']
    redirect '/peeps'
  end

  get '/peeps' do
    @peep = session['peep']
    @user = session['user']
    erb(:'peeps/index')
  end

  run! if app_file == $0
end
