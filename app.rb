require 'sinatra/base'

class ChitterChatter < Sinatra::Base

  get '/' do
    erb :index
  end

  post '/' do
    @peep = params['new_peep']
    erb :index
  end

  run! if app_file == $0

end
