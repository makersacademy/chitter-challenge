
require './lib/user'
require './lib/peeps'
require 'pg'
require 'sinatra'
require 'sinatra/base'
require 'sinatra/reloader' if development?
# http://localhost:4567, rackup -p 4567

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @username = User.username
    @peeps = Peeps.all
    erb(:index)
  end

  get '/sign-up' do
    erb(:'sign-up/index')
  end

  post '/sign-up_action' do
    user_id = User.create(params[:email],params[:password],params[:fullname],params[:username])
    User.login(user_id)
    redirect to '/'
  end

  post '/peep' do
    Peeps.create(params[:peep], User.username, User.time)
    redirect to '/'
  end

  run! if app_file == $PROGRAM_NAME
end
