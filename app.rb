require 'sinatra'
require './lib/peep.rb'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    erb (:index)
  end

  get '/peep' do
    @peep = Peep.all
    erb (:peeps)
  end

  post '/peep' do
    Peep.store(params[:peeps])
    redirect('/peep')
  end

  run! if app_file == $0

end
