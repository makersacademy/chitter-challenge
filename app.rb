require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/' do
    redirect '/chitter'
  end

  get '/chitter' do
    erb :'chitter/index'
  end

  post '/chitter' do
    @peep = params[:peep]
    erb :'chitter/index'
  end

  run! if app_file == $0
end