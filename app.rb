require 'pg'
require 'sinatra'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/sign_up' do
    erb :sign_up
  end

  run! if app_file == $0

end
