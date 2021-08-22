require 'sinatra'
require 'sinatra/reloader'
require './lib/peeps'

class PeepsManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Peeps'
  end

  get '/peeps' do
    @peeps = Peeps.all
    erb :'peeps/index'
  end
  run! if app_file == $0
end