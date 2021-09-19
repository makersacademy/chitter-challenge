require 'sinatra/base'
require 'sinatra/reloader'
require './lib/chitter'

class ChitterManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @all_peeps = Chitter.all
    erb :index
  end

  post '/peep_added' do
    peep = params['peep']
    Chitter.add(peep)
    redirect '/'
  end

  run! if app_file == $0
end
