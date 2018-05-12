require 'sinatra'

require_relative './lib/peep'

class Chitter < Sinatra::Base
  get '/' do
    'Hello world!'
  end

  get '/peeps' do
    @peeps = Peep.all

    erb(:peeps)
  end

  get '/peeps/new' do
    erb(:peeps_new)
  end

  post '/peeps' do
    Peep.create(params['peep'])

    redirect('/peeps')
  end

  run! if app_file == $0
end
