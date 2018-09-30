require 'sinatra/base'
require 'data_mapper'
require './lib/database_connect_setup'
require './lib/peep'

class Chitter < Sinatra::Base

  get '/peeps' do
    @peeps = Peep.all
    erb :peeps
  end

  get '/peeps/new' do
    erb :"peeps/new"
  end

  post '/peeps' do
    Peep.create(peep: params['peep'])
    redirect '/peeps'
  end

  run! if app_file == $0

end
