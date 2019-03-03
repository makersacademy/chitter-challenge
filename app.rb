require 'sinatra/base'
require_relative './lib/peep'
require_relative './lib/database_connection'
class Chitter < Sinatra::Base
  Database_Connection.setup
  get '/feed' do
    @peeps = Peep.all
    erb :feed
  end

  get '/new_peep' do
    erb :new_peep
  end

  post '/new_peep' do
    Peep.new(params[:peep])
    redirect '/feed'
  end

  run! if app_file == $0
end
