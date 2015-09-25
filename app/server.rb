require 'sinatra/base'

class Chitter < Sinatra::Base

  set :views, proc { File.join(root, '..', 'views') }

  get '/' do
    erb :index
  end

  get '/users/new' do
    erb :'users/new'
  end

end
