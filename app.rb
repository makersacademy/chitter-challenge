require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/' do
    erb :'chitter/index'
  end

  get '/chitter/new' do
    erb :'chitter/new'
  end

  get 'chitter/username' do 
  end

  post 'chitter/username' do
    
  end

  run! if __FILE__ == $0
end