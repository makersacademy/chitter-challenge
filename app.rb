# RESTful routes
# GET /peeps
# GET /peeps/:id
# GET /peeps/new
# GET /peeps/update
# POST /peeps
# POST /peeps/:id/update
# POST /peeps/:id/delete

require 'uri'
require 'sinatra'
require 'sinatra/flash'
require './lib/user'
require './lib/peep'
require './lib/database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions, :method_override
  disable :strict_paths

  register Sinatra::Flash

  get '/' do
    'Chitter'
  end

  get '/chitter' do
    @user = User.find(id: session[:user_id])
    @peeps = Peep.all
    erb :'chitter/index'
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    user = User.create(email: params[:email], password: params[:password], name: params[:name], username: params[:username])
    session[:user_id] = user.id
    redirect '/chitter'
  end

  # get '/chitter/:id/peeps/new' do
  #   @user_id = params[:id]
  #   erb :'users/new'
  # end

  # post '/chitter/:id/peeps' do
  #   Peep.create(id: params[:id], peep: params[:peep])
  #   redirect '/chitter'
  # end


  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps/new' do
    Peep.create(peep: params[:peep])
    redirect('/chitter')
  end

  run! if app_file == $0
end