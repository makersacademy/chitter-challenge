require 'sinatra/base'
require 'sinatra/reloader'
require_relative '../lib/peep'
require_relative '../lib/user'

class Chitter < Sinatra::Base

  enable :sessions

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @peeps = Peep.all
    @user = User.current_user
    erb :post_peep
  end

  post '/' do
    Peep.create(params[:peep_message], User.current_user.id)
    redirect '/'
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    User.create(params[:username], params[:email])
    redirect('/')
  end

  get '/login' do
    erb :login
  end

  post '/login' do
    User.assign_user(params[:username])
    redirect '/'
  end

  run! if app_file == $0
end
