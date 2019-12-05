require 'sinatra/base'
require 'pg'

class Chitter < Sinatra::Base

  get '/' do
    @peeps = []
    @peeps << 'My first peep!'
    erb :index
  end

  post '/peeps' do
    redirect '/'
  end

  get '/register' do

  end

  get '/login' do

  end

  run! if app_file == $0
end
