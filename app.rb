require 'sinatra/base'
require './lib/model.rb'

class Chitter < Sinatra::Base
  get '/' do
    @peeps = ChitterHandler.retrieve_peeps
    erb :chitter_feed
  end

  get '/new-peep' do
    erb :new_peep
  end

  post '/new-peep' do
    ChitterHandler.add_peep(params['peep_message'])
    redirect '/'
  end
end
