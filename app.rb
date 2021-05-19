require 'sinatra/base'
require 'sinatra/reloader'
require 'pg'
require_relative './lib/peep'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
  
  get '/' do
    'Chitter'
  end

  get '/peeps' do
    @peeps = [
              "peeps",
              "hello world"
             ]
  
    erb :'peeps/feed'
  end

  get '/peeps/new' do
    erb :"peeps/new"
  end

  post '/peeps' do
    Peep.create(message: params[:message])
    redirect '/peeps'
  end

  run! if app_file == $0
end