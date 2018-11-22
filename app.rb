require 'sinatra/base'

class Chitter < Sinatra::Base

  enable :sessions

  get '/cheets' do
    erb(:"cheets/index")
  end

  run! if app_file == $0
end
