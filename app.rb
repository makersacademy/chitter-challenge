# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'
require 'pg'
require './database_connection_setup'
require './lib/peep'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/feed'
  end

  get '/peeps/new' do
    erb :'peeps/new_peep'
  end

  post '/save-new-peep' do
    Peep.create(content: params[:content])
    redirect '/peeps'
  end

  run! if app_file == $PROGRAM_NAME

end
