require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/sign/up' do
    erb :'sign/up'
  end

  run! if app_file == $0
end
