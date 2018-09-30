require 'sinatra/base'
require 'data_mapper'
require './lib/database_connect_setup'
require './lib/peep'
require './lib/user'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    p params
    @user = User.create(name: params['name'], username: params['username'],
           email: params['email'], password: params['password'])
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :peeps
  end

  get '/peeps/new' do
    erb :"peeps/new"
  end

  post '/peeps' do
    Peep.create(peep: params['peep'])
    redirect '/peeps'
  end

  run! if app_file == $0

end
