require 'sinatra'
require 'sinatra/activerecord'

class Chitter < Sinatra::Base
  configure do
    enable :sessions
    set :views, './lib/views'
  end

  get '/' do
    erb :index
  end

  post '/send-peep' do
    
  end
end
