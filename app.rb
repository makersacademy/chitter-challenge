require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/peep'
require './database_connection_setup'

class ChitterWeb < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions

  get '/peeps' do
    @peeps = Peep.all

    erb :'peeps/index'
  end

  post '/peeps/post' do
    Peep.create(peep: params[:peep])

    redirect '/peeps'
  end

  run! if app_file == $0
end
