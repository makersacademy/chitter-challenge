require 'sinatra/base'

require './database_connection_setup'

class Chitter < Sinatra::Base

  get '/' do
    'Peeps'
  end

  get '/peeps' do
    'a peep'
  end

  get '/peeps/new' do
    erb:'peeps/new'
  end

  post '/peeps' do
    redirect '/peeps'
  end

  run! if app_file == $0
end
