require 'sinatra/base'
require './lib/peeps'

class Chitter < Sinatra::Base
enable :sessions

  get '/' do
    redirect '/peep/new'
  end

  get '/peep' do
    @peeps = Peeps.all
    erb :"peep/index"
  end

  get '/peep/new' do
    erb :"peep/new"
  end

  post '/peep' do
    Peeps.create(peep: params[:peep])
    @peeps = Peeps.all
    erb :"peep/index"
    redirect '/peep'
  end

  run! if app_file == $0
end
