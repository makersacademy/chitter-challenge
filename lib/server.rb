require 'data_mapper'
require 'sinatra/base'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{env}")

require './lib/peep'

DataMapper.finalize

DataMapper.auto_upgrade!

class ChitterChallenge < Sinatra::Base

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  post '/peeps' do
    text = params["text"]
    Peep.create(:text => text)
    redirect to('/')
  end
end
