require 'sinatra/base'
require 'sinatra/reloader'
require 'pg'
require './lib/peeps'

class Chitter < Sinatra::Base
  configure :developement do
    register Sinatra::Reloader
  end

  get '/peeps' do
    @peeps = Peeps.all
    erb :index
  end

  get '/peeps/new' do
    erb :compose_peep
  end

  post '/peeps' do
    peep = params['message']
    Peeps.new(peep)
    redirect('/peeps')
  end

  run! if app_file == $0
end