require 'sinatra/base'

class CHITTER < Sinatra::Base

  get '/' do
    erb :'/index'
  end

  get '/stylesheets/style.css' do
    scss :style
  end

  run! if app_file == $PROGRAM_NAME
end
