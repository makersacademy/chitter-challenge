require 'sinatra/base'
require 'sinatra/reloader'
require 'pg'
require './lib/peeps'

class Chitter < Sinatra::Base
  #configure :development do
   # register Sinatra::Reloader
  #end
  
  get '/' do
    'Chitter'
  end

  get '/peeps' do
    @peeps = Peeps.all
    erb :"peeps/index"
  end

  get '/peeps/new' do
    erb :"peeps/new"
end

  post '/peeps' do
    Peeps.create(params[:peep])
    redirect '/peeps'
  end


  run! if app_file == $0
end