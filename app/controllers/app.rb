require 'sinatra/base'
require './lib/peeps'
require 'pg'
require './connecting_to_database'
require_relative 'user_controller'

class Chitter < Sinatra::Base 
  use UserController
  enable :sessions, :method_override

  get '/' do
    erb :"index"
  end

  get '/peeps' do
    @peeps = Peeps.all
    erb :"peeps/peeps"
  end

  get '/peeps/new' do
    erb :"peeps/new"
  end

  post '/peeps' do
    redirect '/users/new' if session['username'] == nil
    Peeps.create(username: session['username'], peep: params['peep'])
    redirect '/peeps'
  end

  run! if app_file == $0

end