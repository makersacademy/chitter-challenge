require 'sinatra/base'
require 'pg'
require_relative './lib/peep'

class Chitter < Sinatra::Base
  get '/' do
    @peeps = Peep.all
    erb :index
  end

  get '/post_peep' do
    erb :'post_peep'
  end

  post '/post_peep' do
    Peep.add(params[:peep])
    redirect '/'
  end

  run! if app_file == $0
end
