require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/chitter' do
    erb :'stream/index'
  end

  post '/chitter/new' do
    @peep = params[:peep]
  end

  run! if app_file == $0
end
