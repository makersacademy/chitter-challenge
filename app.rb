require 'sinatra/base'
require 'sinatra/reloader'
require './lib/message'
require './lib/database_connection'
require_relative 'database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @peeps = Message.all
    erb(:index)  
  end

  post '/' do
    Message.post(params['peep'])
    redirect('/')
  end

end
