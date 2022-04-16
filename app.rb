require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/peep'
require_relative './database_connection_setup'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb(:index)
  end

  get '/peeps' do
    @peeps = Peep.all
    erb(:'peeps/index')
  end

  get '/peeps/new' do
    erb(:'peeps/new')
  end

  post '/peeps' do
    Peep.post(peep: params[:peep])
    redirect '/peeps'
  end

  get '/users/new' do
    erb(:'users/new')
  end

  post '/users' do
    User.create(
      email: params[:email],
      password: params[:password],
      name: params[:name],
      username: params[:username]
    )
    redirect '/'
  end
end
