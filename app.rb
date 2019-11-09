require 'sinatra/base'
require 'pg'
require './lib/peeps.rb'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/peep' do
    Peeps.create(peep: params['add_peep'])
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peeps.all
    erb :peeps
  end

  run! if app_file == $0
end
