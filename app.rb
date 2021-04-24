require 'sinatra/base'
require 'sinatra/reloader'
require './lib/chitter'

class ChitterChallenge < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  get '/view' do
    @peeps = Chitter.all
    erb :view
  end

  run! if app_file == $0
end
