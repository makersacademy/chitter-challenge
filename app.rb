require 'sinatra/base'
require_relative './app/models/dm_config.rb'

class Chitter < Sinatra::Base

  enable :sessions

  get '/peeps' do
    @peeps = Peep.all
    erb :peeps
  end

end
