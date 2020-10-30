require 'sinatra/base'
require './lib/peep'
require_relative 'database_connection_setup'

class Chitter < Sinatra::Base

  get '/test' do
    'Testing Chitter App'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    User.create(email: params[:email], name: params[:name], username: params[:username], password: params[:password])
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all

    erb :'peeps/index'
  end

  post '/peeps' do
    Peep.create(message: params[:message])
    redirect '/peeps'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  run! if app_file == $0
end
