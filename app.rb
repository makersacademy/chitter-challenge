require 'sinatra/base'
require 'sinatra/reloader'

class ChitterApp < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  post '/' do
    # saves the content of the form to chitter database
    redirect '/peeps'
  end

  get '/peeps' do
    # displays peeps
    erb :peeps
  end

  run! if app_file == $0
end
