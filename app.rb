require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/peeps'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  get '/chitter' do
    @peeps = Peeps.all
    erb :chitter
  end

  run! if app_file == $0
end
