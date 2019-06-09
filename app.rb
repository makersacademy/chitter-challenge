require 'sinatra/base'
require './database_connection_setup'
require './lib/peep'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :peeps
  end

  get '/peeps/new' do
    erb :new_peep
  end

  post '/peeps/new/submit' do
    Peep.create(params[:author],params[:handle],params[:content])
    redirect '/peeps'
  end

  get '/signup' do
    erb :signup
  end

  get '/signup' do
    erb :signup
  end

  get '/signup/new/confirmation' do
    erb :confirmation
  end

  post '/signup/new' do
    User.create(params[:author],params[:handle],params[:password])
    redirect 'signup/new/confirmation'
  end

  run! if app_file == $0
end
