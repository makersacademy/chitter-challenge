require 'sinatra/base'
require './app/models/peep'
require './app/models/user'
require './app/models/db_connection'

class Chitter < Sinatra::Base

  get '/' do
    ENV['RAILS_ENV'] = 'development' if ENV['RAILS_ENV'] != 'test'
    @peeps = Peep.all
    erb :index
  end

  post '/' do
    Peep.create(message: params[:message], user: 1)
    redirect '/'
  end

 DatabaseConnection.setup

end
