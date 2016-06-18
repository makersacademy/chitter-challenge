require 'sinatra/base'
require_relative 'models/chit'




class ChitterChallenge < Sinatra::Base
  get '/' do
    redirect '/chits'
  end

  get '/chits' do
    @chits = Chit.all
    erb :'chits/index'
  end

  run! if app_file == $0

end
