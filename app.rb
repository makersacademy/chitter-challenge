require 'sinatra/base'
require_relative 'lib/database_connection_setup'
require_relative 'lib/peep'

class Chitter < Sinatra::Base

  get '/' do
    @peeps = Peep.all

    erb :index
  end

  post '/' do
    @peeps = Peep.all

    date = params['peep-date']
    time = params['peep-time']
    message = params['message']

    @zero_length_msg = false

    if message != ""
      @peeps.unshift({ timestamp: "#{date} #{time}", message: "#{message}" })
    else
      @zero_length_msg = true
    end

    erb :index

  end

  run! if app_file == $0
end
