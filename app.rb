require 'sinatra/base'
require './lib/chitter'

class App < Sinatra::Base

  get '/chitter' do
    @peeps = Chitter.all.join(",")
    erb(:index)
  end

  post '/peep_post' do
    redirect to('/chitter')
  end

  run! if app_file == $0
end
