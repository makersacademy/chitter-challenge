require 'sinatra/base'
require 'sinatra/reloader'


class Chitter_Messages < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end 

  get '/' do
    erb :index
  end

  post '/sign_in' do
    erb :details
  end


  run! if app_file == $0
end