require 'sinatra/base'
require_relative './lib/peep'
class ChitterManager < Sinatra::Base

  get '/' do
    'chitter'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :peeps
  end

  get '/peeps/new' do
    erb :new
  end

  post '/peeps' do
    Peep.create(peep: params['peep'])
    redirect '/peeps'
  end

  run! if app_file == $0
end
