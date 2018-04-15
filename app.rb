require 'sinatra/base'
require './lib/peep'
require './database_connection_setup'

class Chitter < Sinatra::Base

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  get '/peeps/new' do
    erb :"peeps/new"
  end

  post '/peeps' do
    Peep.create(params)
    redirect '/'
  end

  run! if app_file == $0
end
