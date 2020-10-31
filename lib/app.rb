require 'sinatra/base'
require './lib/model/peep'
require 'pg'


class Chitter < Sinatra::Base
  enable :sessions


  get '/' do
    'Hello World!'
  end

  get '/peep' do
    @peeps = Peep.all
    erb :index
  end

  get '/peep/new' do
    erb :"peep/new"
  end

  post '/peep' do
    Peep.create(peep: params[:peep])
    redirect '/peep'
  end


  run! if app_file == $0
end
