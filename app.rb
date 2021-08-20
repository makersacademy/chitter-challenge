require 'sinatra/base'
require 'sinatra/reloader'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  get '/sign-up' do
    erb :signup
  end

  post '/welcome' do
    'Thank you for signing up to Chitter!'
  end

  run! if app_file == $0
end
