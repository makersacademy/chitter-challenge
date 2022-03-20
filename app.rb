require 'sinatra/base'
require 'sinatra/reloader'
require './database_connection_setup'
require_relative './lib/peep'

class ChitterApp < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    redirect('/peeps')
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peep/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(peep: params[:peep])
    redirect('/peeps')
  end

  post '/peep/new' do
    erb :'peeps/new'
   end

  run! if app_file == $0
end
