require 'sinatra/base'
require './lib/peeps'

class Chitter < Sinatra::Base
enable :sessions

  get '/' do
    erb(:index)
  end

  post '/peep' do
    @peep = params[:peep]
    @peeps = Peeps.all
    erb(:peep)
  end

  run! if app_file == $0
end
