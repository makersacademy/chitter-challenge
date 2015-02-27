require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/users/sign_in' do
    erb :"users/sign_in"
  end

end
