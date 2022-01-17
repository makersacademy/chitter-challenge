require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    also_reload './lib/peep'
  end

  enable :sessions

  get '/peeps' do
    @peep = Peep.show
    erb(:peeps)
  end

  post '/peeps' do
    Peep.create(params[:peep])
    redirect '/peeps'
  end
end
