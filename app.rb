require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require 'uri'
require './lib/peep'
require './database_connection_setup'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions, :method_override
    register Sinatra::Flash 
    
  get '/' do
    erb :homepage
  end

  post '/user/new' do
    redirect '/sessions/new'
  end

  get '/sessions/new' do
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end
end