require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/chitter' do
    erb :homepage
  end

end 
