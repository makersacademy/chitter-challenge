require 'sinatra/base'
require './lib/peep'
require 'pg'

class Chitter < Sinatra::Base

  get '/' do
    'Hello World'
  end

  get '/chitter' do
    @peeps = Peep.all

    erb :'chitter/index'
  end

  post '/chitter/add' do
    Peep.create(text: params[:text])

    redirect '/chitter'
  end

  run! if app_file == $0
end
