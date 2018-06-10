require 'uri'
require 'sinatra'
require 'sinatra/flash'
require 'sinatra/base'
require './lib/messenger'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

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
    Messenger.create(params['message'])
    erb :posted
  end

  # get '/chitter/peep/posted' do
  #   erb :posted
  # end

  run if app_file == $0
end
