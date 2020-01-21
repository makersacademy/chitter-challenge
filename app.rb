require 'sinatra/base'

require './lib/Chitter'
require './database_connection_setup'

class ChitterServer < Sinatra::Base

  get '/chitter' do
    @peeps = Chitter.all.reverse
    erb :chitter
  end

  post '/posting_peeps' do
    peep = params[:post_peep]
    Chitter.post(peep)
    redirect '/chitter'
  end

  run! if app_file == $0
end
