require 'sinatra/base'
require 'sinatra/reloader'
require './database_connection_setup'
require './lib/peep'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb(:home)
  end

  get '/peepstream' do
    @peeps = Peep.all
    erb(:peepstream)
  end

  post '/peepstream' do
    Peep.create(peep: params[:peep])
    redirect '/peepstream'
  end 

  run! if app_file == $0
end
