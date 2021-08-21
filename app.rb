require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/chitter'

class Chitter_app < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  get '/peeps' do
    @pip = Chitter.all
    erb :peeps
  end

  post '/peeps' do
    redirect '/peeps'
  end

  run! if app_file == $0
end
