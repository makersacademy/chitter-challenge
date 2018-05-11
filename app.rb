require 'sinatra/base'
require './lib/peeps.rb'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/chitter' do
    erb :index
  end
  
  run! if app_file == $0
end
