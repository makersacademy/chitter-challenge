require 'sinatra/base'
require_relative './lib/peeps'
require './database_connection_setup'


class Chitter < Sinatra::Base

  get '/' do
    @peeps = Peep.all
    erb(:index)
  end

  post '/peeps' do
    Peep.post(message: params['message'], timestamp: params['timestamp'])
    redirect '/'
  end

  run! if app_file == $0
end
