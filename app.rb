require 'sinatra/base'
require 'sinatra/flash'
require './lib/peep'
require './lib/user'
require './database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions
  #register Sinatra::Flash

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @user = User.find(session[:user_id])
    @peeps = Peep.all
    erb :"peeps/index"
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    User.create(email: params['email'], username: params['username'], userhandle: params['userhandle'], password: params['password'])
    session[:user_id] = user.id
    redirect '/'
  end

  get '/peeps/new' do
    erb :"peeps/new"
  end

  post '/peeps' do
    peep = Peep.create(username: params[:username], userhandle: params[:userhandle], peep: params[:peep_text])
    redirect '/peeps'
  end

  get '/peepsfeed' do
    @peeps = Peep.all
    # @peep = Peep.create(params[:username], params[:userhandle], params[:peep])
    erb :peepsfeed
  end
  # get '/create-new-peep' do
  #   Peep.create(params[:username], params[:userhandle], params[:peep])
  #   erb :peepsfeed
  #   # redirect '/'
  # end
  run! if app_file == $0
end
