require 'pg'
require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base
  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :peeps
  end

  get '/peeps/new' do
    erb :new_peep
  end

  post '/peeps/new' do
    Peep.create(params['peep'])
    redirect '/peeps'
  end
end
