require 'sinatra/base'
require './lib/chitter.rb'

class Chitterapp < Sinatra::Base

  get '/' do
    @chit = Chitter.all
    erb :index
  end

  # post '/sending' do
  #   Chitter.create({name: params['name'], peep: params['title']})
  #   redirect '/'
  # end

  run! if app_file == $0
end
