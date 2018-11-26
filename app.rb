require 'sinatra/base'
require_relative './lib/peeps'
require './database_connection_setup'


class Chitter < Sinatra::Base

  get '/' do
    erb(:login)
  end

  get '/peeps' do
    @peeps = Peep.all
    erb(:index)
  end

  post '/peep' do
    Peep.post(message: params['message'])
    redirect '/peeps'
  end

  run! if app_file == $0
end
