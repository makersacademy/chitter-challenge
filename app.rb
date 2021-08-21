require_relative './lib/peep'
require 'sinatra/base'
require 'sinatra/reloader'
require_relative './database_connection_setup.rb'

class Chitter < Sinatra::Base
  enable :sessions, :method_override
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @peeps = Peep.all
    erb :index
  end


  run! if app_file == $0
end