require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    "Hello world"
  end

  get '/peeps' do
    

  run! if app_file == $0