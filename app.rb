require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/peep'
require_relative 'database_connection_setup'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @peeps = Peep.list
    erb :index
  end

  post '/peep' do
    @message = params[:message]
    Peep.create(@message)
    redirect '/'
  end

  run! if app_file == $PROGRAM_NAME
end
