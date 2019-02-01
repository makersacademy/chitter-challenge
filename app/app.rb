require 'sinatra/base'
require_relative '../lib/peeps'
require_relative '../spec/test_database'

class Chitter < Sinatra::Base

  get '/' do
    erb(:index)
  end

  get '/peeps' do
    @peeps = Peeps.list
    erb(:peeps)
  end

  post '/add_peep' do
    Peeps.add(peep: params[:peep])
    redirect '/peeps'
  end

  run! if app_file == $0
end
