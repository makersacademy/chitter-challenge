require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base

  get '/' do
    redirect '/chitter'
  end

  get '/chitter' do
    erb :chitter
  end

  get '/chitter/peeps' do
    erb :peeps
  end

  post '/peeps' do
    p "Peep submitted"
    p params
      @peeps = Peep.all
    erb :peeps
  end

  # post '/peeps' do
  #   @peeps = Peep.all
  #   erb :peeps
  # end

  run! if app_file == $0
end
