require 'pg'
require 'sinatra/base'
require './lib/message'
require './lib/user'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/signup' do
    erb :'signup/index'
  end

  post '/signup' do
    User.signup(name: params[:name], email: params[:email], username: params[:username], password: params[:password])
    redirect '/peeps'
  end

  get '/create' do
    erb :'create/index'
  end

  post '/peeps' do
    Message.add(peep: params[:peep])
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Message.all
    erb :'peeps/index'
  end

  run! if app_file == $0
end
