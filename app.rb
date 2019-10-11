require 'sinatra/base'
require './lib/peep'

require_relative './database_connection_setup'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    redirect '/peeps'
  end

  get '/users/sign_in' do
    "Coming soon"
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/peeps'
  end

  get '/peeps/new' do
    erb:'peeps/new'
  end

  post '/peeps' do
    Peep.create(message: params[:message])
    redirect '/peeps'
  end

  run! if app_file == $0
end
