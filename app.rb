require 'sinatra/base'
require 'pg'
require './lib/peep.rb'

class Chitter < Sinatra::Base  
  
  get '/' do
    'Welcome to Chitter!'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index' 
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(peep: params[:Peep])
    redirect '/peeps'
  end

  run! if app_file == $0
end
