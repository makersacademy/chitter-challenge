require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep.rb'
require 'pg'

class Chitter < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end
  
  get '/peeps' do
    @peeps = Peep.all
    erb :index
  end

  get '/post' do
    erb :post
  end

  post '/peeps' do
    @peep = params[:peep]
    Peep.add(@peep)
    redirect '/peeps'
  end

  run! if app_file == $0

end
