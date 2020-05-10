require 'sinatra/base'
require './lib/chitter'
class ChitterChatter < Sinatra::Base

  get '/' do
    @peeps = Chitter.all
    erb :index
  end

  post '/' do
    peep = params['new_peep']
    Chitter.add(peep)
    redirect '/'
  end

  run! if app_file == $0

end
