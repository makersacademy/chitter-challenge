
require 'sinatra/base'
require_relative './lib/peeps'

class Chitter < Sinatra::Base
  get '/' do
    @chitterpeeps = Peeps.all
    erb :index
  end

  post '/postpeep' do
    Peeps.create(peep: params[:peep])
    redirect '/'
  end

  run! if app_file == $0
end
