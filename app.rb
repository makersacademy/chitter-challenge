require './lib/cheet'
require 'sinatra/base'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    redirect '/cheets'
  end

  get '/cheets' do
    @cheets = Cheet.all
    erb(:"cheets/index")
  end

  run! if app_file == $0
end
