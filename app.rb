require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/peeps'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  get '/chitter' do
    @peeps = Peeps.all
    erb :chitter
  end

  get '/chitter/add' do
    erb :add
  end

  post '/chitter' do
    Peeps.add(post: params['peep_text'])
    redirect '/chitter'
  end

  run! if app_file == $0
end
