require 'sinatra/base'
require_relative '../lib/peep'

class ChitterApp < Sinatra::Base

  get '/chitter' do
    @peeps = Peep.all
    erb :chitter
  end

  get '/chitter/new' do
    erb :compose
  end

  post '/chitter' do
    Peep.create(content: params[:content])
    redirect '/chitter'
  end

  run! if app_file == $0
end
