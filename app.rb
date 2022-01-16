require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep'
require './lib/user'
require_relative 'database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions, :method_override

  configure :development do
    register Sinatra::Reloader
  end

  get '/chitter' do
    @peeps = Peep.all

    erb :index
  end

  post '/chitter' do
    Peep.create(message: params[:peep])
      
    redirect '/chitter'
  end
  
  run! if app_file == $0
end
