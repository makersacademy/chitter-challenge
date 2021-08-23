require_relative './lib/peep'
require 'sinatra/base'
require 'sinatra/reloader'

class Zwitscher < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :'zwitscher/index'
  end

  post '/peep' do
    Peep.create(time: '12:11', message: params[:peep])
    redirect '/zwitscher/read'
  end

  get '/zwitscher/read' do
    @peeps = Peep.all
    erb :'zwitscher/read_peeps'
  end

  run! if app_file == $0
end
