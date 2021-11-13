require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/peep'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Hello and Welcome to the Chitter app!'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  run! if app_file == $0
end
