require 'data_mapper'
require 'tilt/erb'
require './app/peep'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

require './app/peep'

DataMapper.finalize
DataMapper.auto_upgrade!

require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  post '/peeps' do
    message = params['message']
    Peep.create message: message
    redirect to '/'
  end

  run! if app_file == $PROGRAM_NAME

end
