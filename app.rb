require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/new_peep' do
    erb :new_peep
  end

  post ''

  run! if app_file == $0
end