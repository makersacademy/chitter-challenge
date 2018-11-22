require 'sinatra/base'
require_relative './lib/chitter_feed'

class Chitter < Sinatra::Base

  get '/' do
    @peeps = ChitterFeed.all
    erb :chitter_feed
  end

  run! if app_file == $0
end
