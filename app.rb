require 'sinatra/base'
# require './lib/peeps'
require 'pg'

class Chitter < Sinatra::Base

  get '/' do
    "Welcome to Chitter"
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps/new' do
    "Despite constant negative press covfefe"
  end
end
