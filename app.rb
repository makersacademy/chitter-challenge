require 'sinatra/base'
require_relative './lib/dm'
require_relative './lib/helpers'

class Chitter < Sinatra::Base

  get '/' do
    redirect(:peep_feed)
  end

  get '/peep_feed' do
  	@peeps = Peep.all(:order => [:created_at.asc], :limit => 10)
  	erb(:peep_feed)
  end

  run! if app_file == $0
end