require 'sinatra'

class Chitter < Sinatra::Application

  get '/' do
    'Welcome to Chitter!'
    erb :index
  end

  run! if app_file == $0
end