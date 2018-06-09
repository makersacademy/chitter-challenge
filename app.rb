require 'uri'
require 'sinatra'
require 'sinatra/flash'
require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    redirect '/chitter'
  end

  get '/chitter' do
    erb :index
  end

  get '/chitter/peep' do
    erb :peep
  end

  post '/chitter/peep' do
    @message = 'Hi there!'
    erb :peep
  end

  run if app_file == $0
end
