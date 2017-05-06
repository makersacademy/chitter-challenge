require 'sinatra/base'

class Chitter < Sinatra::Base
  set :sessions, true

  get '/' do
    erb(:index)
  end

  get '/signup' do
    erb(:signup)
  end
end
