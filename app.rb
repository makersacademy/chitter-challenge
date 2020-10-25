require 'sinatra/base'
require './database_connection_setup'
require_relative './lib/maker'
require_relative './lib/peep'

class Chitter < Sinatra::Base
  enable :sessions, :method_override

  get '/' do
    'Hello, World!'
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    maker = Maker.create(
      email: params[:email],
      password: params[:password],
      name: params[:name]
    )

    session[:maker_id] = maker.id
    redirect('/peeps')
  end

  get '/peeps' do
    @maker = Maker.find(id: session[:maker_id])
    erb :'peeps/index'
  end

  get '/peeps/list' do
    @peeps = Peep.all
    erb :'peeps/list'
  end

  get '/sessions/new' do
    erb :"sessions/new"
  end

  post '/sessions' do
    maker = Maker.authenticate(
      email: params[:email],
      password: params[:password]
    )
    session[:maker_id] = maker.id
    redirect('/peeps')
  end

  post '/sessions/destroy' do
  session.clear
  redirect('/peeps')
end

  run! if app_file == $0
end
