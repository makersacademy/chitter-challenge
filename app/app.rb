require 'sinatra/base'
require './lib/database_connection_setup'
require './lib/peep'

class Chitter < Sinatra::Base

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/all'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(text: params['text'])
    redirect '/peeps'
  end

  run! if app_file == $0
end
