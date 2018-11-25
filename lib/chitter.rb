require 'sinatra/base'
require './database_connection_setup'
require_relative './views/view_helpers'
require_relative './models/peep'

class Chitter < Sinatra::Application
  include ViewHelpers
  set :sessions, true
  set :layout, true

  get '/users/new' do
    erb(:'users/new')
  end

  post '/users' do
    user =  User.create(user_name: params['user_name'],
                email: params['email'],
                password: params['password'],
                name: params['name'])
    session[:user_id] = user.id
    redirect '/peeps'
  end

  get '/peeps' do
    @user = User.find(session[:user_id])
    @peeps = Peep.all
    erb(:'peeps/index')
  end

  get '/peeps/new' do
    erb(:'peeps/new')
  end

  post '/peeps/new' do
    Peep.create(content: params['content'])
    redirect '/peeps'
  end
end
