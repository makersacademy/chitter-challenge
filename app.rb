require 'sinatra/base'
require 'rack'
require './lib/chitter'
require 'time'

class App < Sinatra::Base

  enable :sessions

  get '/' do
    @chitters = Chitter.all
    erb :homepage
  end

  post '/peep' do
    Chitter.add(text: params[:peep], username: 'Becka', peep_time: DateTime.now)
    redirect '/'
  end

  run! if app_file == $0

end
