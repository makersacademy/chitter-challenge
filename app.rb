require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    erb(:homepage)
  end

  get '/peep/new' do
    'l'
  end

run if app_file == $0

end