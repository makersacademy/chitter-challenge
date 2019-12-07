require 'sinatra/base'
require 'pg'
require_relative './lib/peep'

class Chitter < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/peep/new' do
    erb :'/peep/new'
  end

  post '/peep' do
    Peep.create(message: params["message"])
    redirect "/peep"
  end

  get '/peep' do
    @peeps= Peep.all
    erb :"peep/timeline"
  end

  run! if app_file == $0

end
