require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do 
    erb(:index)
  end

  get '/user/new' do 
    erb(:new_user)
  end

  run! if app_file == $0

end