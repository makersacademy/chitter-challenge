require 'sinatra'

class Chitter < Sinatra::Base
  enable :sessions

  get('/') do
    erb :index
  end

  get('/register') do
    erb :register
  end

  run! if app_file == $PROGRAM_NAME

end
