require 'sinatra/base'
require 'pg'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  post '/peeps' do
    erb :index
  end


  # get '/register' do
  #
  # end
  #
  # get '/login' do
  #
  # end

  run! if app_file == $0
end
