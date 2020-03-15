require 'sinatra/base'
require './lib/peep'
require 'pg'
require './database_connection_setup'

class Chitter < Sinatra::Base
  get '/' do
    'Chitter'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    @peeps = Peep.all
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(text: params[:text])
    redirect '/peeps'
  end

  run! if app_file == $0
end
