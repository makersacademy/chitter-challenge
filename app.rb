require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep'
require './lib/database_connection_setup'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    also_reload './lib/peep.rb'
  end

  enable :sessions

  get '/peeps' do
    @peeps = Peep.show
    erb(:peeps)
  end

  post '/peeps' do
    Peep.create(params[:peep])
    redirect '/peeps'
  end
end
