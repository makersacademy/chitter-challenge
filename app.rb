require 'sinatra/base'
require './lib/peep.rb'
require './lib/database_connection'
require './database_connection_setup'

class Chitter < Sinatra::Base

  enable :sessions, :method_override # allows us to use patch, delete etc

  get '/' do
    @peeps = Peep.all
    erb(:index)
  end

  post '/peep' do
    Peep.create(params[:peep])
    redirect '/'
  end

  run! if app_file == $0
end
