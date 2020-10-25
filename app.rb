require 'sinatra/base'
require_relative './lib/chitter.rb'

class Chitter < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/chitter_feed' do
    @peeps = Peep.all
    erb :chitter_feed
    #pass information from database to views 
  end

  get '/chitter_feed/new_peep' do
    erb :new_peep
  end
end