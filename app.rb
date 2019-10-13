require 'sinatra'
require 'sinatra/flash'
require 'uri'

require './lib/peep'

class Chitter < Sinatra::Base
  get '/' do
    erb :homepage
  end

  get '/index' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/new' do
    erb :'peeps/new'
  end

  post '/index' do
    Peep.create(text: params['text'])
    redirect '/index'
  end

  run! if app_file == $0
end
