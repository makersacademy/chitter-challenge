require 'sinatra/base'
require './lib/peep.rb'
require_relative './database_connection_setup'


class Chitter < Sinatra::Base

  get '/' do
    'Chitter'
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(message: params[:message], peep_timestamp: Time.now)
    redirect '/peeps'
  end

  run! if app_file == $0
end
