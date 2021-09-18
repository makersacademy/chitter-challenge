require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/peep'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  get '/chitter' do
    @peeps = Peep.all
    erb :chitter
  end

  get '/chitter/add' do
    erb :add
  end

  post '/chitter' do
    Peep.add(post: params['peep_text'])
    redirect '/chitter'
  end

  run! if app_file == $0
end
