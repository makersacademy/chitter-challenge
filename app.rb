require 'sinatra/base'
require 'sinatra/reloader'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/board' do
    erb :'/peeps/board'
  end

  get '/peeps/message' do
    erb :'/peeps/message'
  end
  
  post '/peeps/message' do
    redirect '/board'
  end

  run! if app_file == $0
end
