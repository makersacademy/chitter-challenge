require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  post '/feed' do
    Peep.create(params[:peep])
    redirect '/feed'
  end

  get '/feed' do
    @peeps = Peep.all
    erb :feed
  end

  run! if app_file == $0
end
