require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb(:index)
  end

  get '/peeps' do
    @peeps = Peep.all
    erb(:peeps)
  end

  get '/new-peep' do
    erb(:new_peep)
  end

  post '/peeps' do
    time = Time.now
    Peep.create(message: params["message"], time: time)
    redirect '/peeps'
  end

  run! if app_file == $0
end
