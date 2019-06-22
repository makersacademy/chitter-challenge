require 'sinatra/base'
require './lib/peep'
require './lib/database_connection_setup'

class Chitter < Sinatra::Base

  get '/' do
    "Welcome to Chitter"
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :"peeps/index"
  end

  get '/peeps/new' do
    erb :"peeps/new"
  end

  post '/peeps' do
    Peep.create(peep: params[:peep])
    redirect '/peeps'
  end

  get '/members/new' do
    erb :"members/new"
  end

  post '/members' do
    name = params[:name]
    username = params[:username]
    email = params[:email]
    password = params[:password]
    Member.create(name: name, username: username, email: email, password: password)
    redirect '/peeps'
  end

  run! if app_file == $0
end
