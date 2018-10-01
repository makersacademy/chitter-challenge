require 'sinatra/base'
require './lib/cheets'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    @cheets = Cheets.all.reverse
    erb :index
  end

  post '/peep' do
    @cheets = Cheets.create(body: params['peep'])
    redirect '/'
  end

  run! if app_file == $0
end
