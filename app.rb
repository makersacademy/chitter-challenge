require './lib/peeper'
require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    erb :splash
  end
  
  get '/register' do
    erb :register
  end

  post '/registration' do
    @peeper = Peeper.create(name: params[:name], email: params[:email], password: params[:password])
    erb :home
  end

  run! if app_file == $0
end
