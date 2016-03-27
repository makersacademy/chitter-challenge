require 'sinatra/base'
require '../lib/datamapper_setup.rb'
class Chitter < Sinatra::Base
  get '/' do
    'Hello chitter!'
  end

  get '/user/sign_up' do
    erb(:sign_up)
  end



  # start the server if ruby file executed directly
  run! if app_file == $0
end
