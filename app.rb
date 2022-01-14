require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep'

class Chitter < Sinatra::Base
  enable :sessions, :method_override

  configure :development do
    register Sinatra::Reloader
  end

  get '/chitter' do
    @peeps = Peep.all

    erb :index
  end

  run! if app_file == $0
end
