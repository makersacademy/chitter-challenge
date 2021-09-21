require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep'
require_relative './database_connection_setup'

class Chitter < Sinatra::Base

  set :public_folder, 'public'
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  run! if app_file == $0
end
