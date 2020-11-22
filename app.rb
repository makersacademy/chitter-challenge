require 'sinatra/base'
require './lib/cheeps'
require './database_connection_setup'

class Chitter < Sinatra::Base

  get '/' do
    redirect '/cheeps'
  end

  get '/cheeps' do
    @cheeps = Cheeps.all
    erb :'cheeps/index'
  end

  get '/cheeps/new' do
    erb :'cheeps/new'
  end

  post '/cheeps' do
    Cheeps.create(text: params['text'])

    redirect '/cheeps'
  end
  run! if app_file == $0
end
