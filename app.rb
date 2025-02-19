require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/peep'

class ChitterManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Welcome to Chitter! Try typing /chitter in the URL to get started.'
  end

  get '/chitter' do
    @peep = Peep.all
    erb :chitter
  end

  # post '/chitter' do
  #   @peep = Peep.all
  #   redirect '/chitter'
  # end

  run! if app_file == $0
end