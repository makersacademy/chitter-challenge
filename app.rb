require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/peep' do
    redirect '/peep'
  end

  get '/peep' do
    erb :peep
  end

  run! if app_file == $0

end
