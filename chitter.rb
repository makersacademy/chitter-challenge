require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/stream' do
    erb :'stream/index'
  end

  post '/stream/new' do
    @peep = params[:peep]
  end

  run! if app_file == $0
end
