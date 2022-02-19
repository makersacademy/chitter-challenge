require 'sinatra/base'
require 'sinatra/reloader'
require 'pg'
require './lib/chitter.rb'


class Chitter < Sinatra::Base 
  configure :development do 
    register Sinatra::Reloader 
  end

  get '/' do
    'Welcome to Chitter'
  end

  get '/peeps/new' do
    erb :"peeps/new"
   
  end

  post '/peeps' do
  Chitterpeep.add_peep(params[:peep])
  redirect '/peeps'
  end

  get '/peeps'do
    @peeps = Chitterpeep.view_peep
    erb :'peeps/index'
  end

  run! if app_file == $0
end