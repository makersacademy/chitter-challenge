require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep'
require_relative './database_connection_setup.rb'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Welcome to Chitter'
  end

  get '/peeps' do
    @peeps = Peep.sort_all_peeps 
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do 
    Peep.add(content: params[:peep], user: params[:user], handle: params[:handle])
    redirect '/peeps' 
  end
 
  run! if app_file == $0
end