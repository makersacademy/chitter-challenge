require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/chitter'
require_relative './lib/peep'
require_relative './setting_up_correct_database'

class Chitter_clone < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Hello World'
  end

  get '/peep/new' do
    erb :'peep/new'
  end

  post '/chitter' do
    peep = Peep.create(peep: params[:peep])
    redirect '/chitter'
  end

  get '/chitter' do
    @chitter = Chitter.all
    erb :'chitter/index'
  end  

  run! if app_file == $0
end