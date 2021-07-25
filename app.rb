require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peeps'

class Chitter < Sinatra::Base
  register Sinatra::Reloader

  get '/chitter' do
    @peeps = Peeps.all
    erb(:'chitter/index')
  end

  get '/chitter/add' do
    erb(:'chitter/add')
  end

  post '/chitter' do
    Peeps.create(peep: params[:peep])
    redirect '/chitter'
  end



  # start the server if ruby file executed directly
  run! if app_file == $0
end