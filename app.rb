require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/peep.rb'
require_relative './lib/database_connection_setup.rb'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    redirect '/chitter'
  end

  get '/chitter' do
    @peeps = Peep.all
    erb :'chitter/index'
  end

  post '/chitter' do
    p params
    @peep = Peep.create(content: params[:content])
    redirect '/chitter'
  end

    run! if app_file == $0
end