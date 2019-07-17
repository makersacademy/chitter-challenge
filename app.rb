require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base

  get '/' do
    'peep'
  end

  get '/peep' do
    @peep = Peep.message
    erb(:peep)
  end

  get '/peep/new' do
    erb :"peep/new"
  end

  post '/peep' do
    Peep.create(url: params[:url])
    redirect '/peep'
  end

  run! if app_file == $0

end
