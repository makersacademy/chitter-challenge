require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep'


class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    also_reload './lib/peep'
  end

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :peeps
  end

  post '/new_peep' do
    Peep.create(params['message'])
    redirect '/peeps'
  end

  run if app_file == $0

end