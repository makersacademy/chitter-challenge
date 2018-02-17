require 'sinatra/base'
require 'pg'
require_relative 'lib/peep'

class Chitter < Sinatra::Base

  get '/peeps/' do
    @peeps = Peep.all
    erb(:index)
  end

  get '/peeps/new' do
    @peeps = Peep.all
    erb(:index)
  end

  post '/peeps' do
    Peep.create(params['new_peep'])
    redirect '/peeps/new'
  end

  run! if app_file == $0

end
