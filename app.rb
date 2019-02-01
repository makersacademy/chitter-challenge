require 'sinatra/base'
require_relative './lib/setup_database_connection'
require_relative './lib/peep'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/peep_feed' do
    @peeps = Peep.all
    erb :peep_feed
  end

  get '/peep_feed/new_peep' do
    erb :new_peep
  end

  post '/peep_feed' do
    Peep.create(params[:new_peep])
    redirect '/peep_feed'
  end
end
