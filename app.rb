require 'sinatra/base'
require 'database_connection_setup'
require './lib/database_connection'

class ChitterApp < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    redirect ('/peeps')
  end

  get '/peeps' do
    erb :"peeps/index"
  end

  get '/peeps/new' do

  end

  post '/peeps/new' do

    redirect ('/')
  end

end
