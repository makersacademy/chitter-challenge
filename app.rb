require 'sinatra/base'
require './lib/peeps'

class Chitter < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/peeps' do
    @peeps = Peeps.all
    erb :peeps
  end

  get '/new' do
    erb :new
  end

  post '/peeps' do
    Peeps.create(peep: params['peep'])
    redirect '/peeps'
end

  run! if app_file == $0
end
