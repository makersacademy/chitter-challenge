require 'sinatra/base'
require './lib/peeps.rb'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/chitter' do
    erb :index
  end

  get '/sign_up' do
    erb :sign_up
  end

  get '/sign_in' do
    erb :sign_in
  end

  get '/new_peep' do
    erb :new_peep
  end
  
  run! if app_file == $0
end
