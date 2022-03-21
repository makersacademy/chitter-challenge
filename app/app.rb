require 'sinatra/base'
require 'sinatra/reloader'
require './app/models/peep.rb'
require './database_connection_setup'

class Chitter < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
   redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :index
  end

  get '/peeps/new' do
    erb :new
  end

  post '/peeps' do
    Peep.create(content: params['message'])
    redirect '/peeps'
  end

  run if app_file == $0

end