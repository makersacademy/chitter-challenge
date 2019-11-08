require 'sinatra'
require 'sinatra/base'

class Chitter < Sinatra::Base
  enable :sessions

  get '/peep' do
    erb :peep
  end





  run! if app_file == $0

end