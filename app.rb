require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/activerecord'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  post '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    erb :'peeps/index'
  end

  run! if app_file == $0
end
