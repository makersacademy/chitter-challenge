require 'sinatra/base'
require './lib/peep.rb'
require './database_connection_setup'

class Chitter < Sinatra::Base

  get '/' do
    @peep = Peep.all
    erb :"peeps/index"
  end

  get '/peeps/new' do
    erb :"peeps/new"
  end

  post '/peeps/new' do
    time = DateTime.now
    Peep.create(params['message'], time)
    redirect '/'
  end

  run! if app_file == $0
end
