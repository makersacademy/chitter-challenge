require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/home' do
    erb :home
  end

  run! if app_file == $0
end
