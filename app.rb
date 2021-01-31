require 'sinatra/base'
require "./lib/peep"

class Chitter < Sinatra::Base

  get '/' do
    @peeps = Peep.feed
    erb :'index'
  end

  get '/postmessage' do
    erb :'postmessage'
  end

  post '/postmessage' do
    Peep.create(peep: params[:peep])
    redirect '/'
  end

  post '/' do
    @peeps = Peep.feed
    @peeps << params[:peep]
    erb :'index'
  end

  run! if app_file == $0

end
