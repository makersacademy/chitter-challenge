require './config/data_mapper'
require 'pry'
require 'sinatra/base'

class Chitter < Sinatra::Base
  enable :sessions
  enable :method_override

  ENV['RACK_ENV'] = 'development'

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  post '/peep' do
    Peep.create(text: params[:peep])
    redirect '/'
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    redirect '/profile'
  end

  get 'profile' do
    erb :profile
  end
end
