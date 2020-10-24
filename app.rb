require 'sinatra/base'
require './database_connection_setup'
require_relative './lib/maker'

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

  run! if app_file == $0
end
