require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base
  get '/' do
    @peeps = Peep.all
    erb :index
  end

  post '/' do
    Peep.create(comment: params['comment'])
    redirect '/'
  end

  run! if app_file == $0

end
