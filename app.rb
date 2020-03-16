require 'sinatra/base'
require_relative './lib/peep'

class Chitter < Sinatra::Base
  get '/' do
    "Peep Manager"
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/peeps'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(peeps: params[:peeps])
    redirect '/peeps'
  end

  run! if app_file == $0 
end