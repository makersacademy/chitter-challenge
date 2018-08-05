require 'sinatra/base'
require 'sinatra/flash'
require_relative './model/db_processor'
# main program class
class App < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do 
    redirect('/home')
  end

  get '/home' do
    @messages = DbProcessor.read('twats')
    erb(:index)
  end
  post '/send-message' do
    DbProcessor.write(params.values.join, 'twats')
    redirect('/home')
  end

  run! if app_file == $PROGRAM_NAME

end
