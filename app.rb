require 'sinatra/base'

require './lib/Chitter'
require './database_connection_setup'

class ChitterServer < Sinatra::Base

  get '/chitter' do
    erb :chitter
  end

  post 'posting_peeps' do
    redirect '/chitter'
  end

  run! if app_file == $0
end
