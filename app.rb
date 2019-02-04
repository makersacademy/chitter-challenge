# frozen_string_literal: true

require 'sinatra/base'
require_relative './db/database_connection_setup.rb'
require_relative './lib/handle_peeps.rb'
require_relative './lib/session_variables.rb'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    @peeps = HandlePeeps.all
    erb :index
  end

  post '/add_peep' do
    # @peep = SessionVariables.create(params['new_peep'])
    HandlePeeps.add_peep(params['new_peep'])
    redirect '/'
  end

  run! if app_file == $PROGRAM_NAME
end
