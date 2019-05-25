require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base

  get '/chitter' do
    erb :chitter
  end

  post '/peeps' do
    Peep.create(message: params[:message])
    @peeps = Peep.all
    erb :peeps
  end

  get '/peeps' do
    erb :peeps
  end

  run! if app_file == $0
end
