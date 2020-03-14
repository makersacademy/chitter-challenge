require 'sinatra/base'
require_relative './database_connection_setup.rb'
require './lib/peep'
require 'pg'

class Chitter < Sinatra::Base

  get '/' do
    'Chitter'
  end

  get '/peeps' do
    @peeps = Peep.all

    erb :"peeps/index"
  end

  get '/peeps/new' do
    erb :"peeps/new"
  end

  post '/peeps' do
    Peep.create(peep: params[:peep])
    redirect '/peeps'
  end

  run! if app_file == $0
end
