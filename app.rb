require 'pg'
require 'sinatra/base'

class ChitterChatter < Sinatra::Base

  get "/" do
    erb :index
  end

  get '/peeps/new' do
    "Henlo"
    # erb :'peeps/new'
  end

  run! if app_file == $0

end
