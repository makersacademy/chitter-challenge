require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    'This is Chitter'
    erb :index
  end

  post '/new' do
    erb :new
  end

end
