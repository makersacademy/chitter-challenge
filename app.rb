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
    message = params['message']

    @zero_length_msg = message.length.zero?

    unless @zero_length_msg
      DatabaseConnection.query("INSERT INTO peeps VALUES (DEFAULT, DEFAULT, '#{message}')")
      redirect '/'
    end

    erb :index

  end

  run! if app_file == $0
end
