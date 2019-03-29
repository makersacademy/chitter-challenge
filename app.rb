require 'sinatra/base'
require './lib/chitter.rb'
class ChitterApp < Sinatra::Base
  # enable :sessions
  # configure(:development) { set :session_secret, "something" }
  get '/' do
    redirect '/chitter'
  end

  get '/chitter' do
    @peeps = Chitter.all
    erb(:'chitter/index')
  end

  run! if app_file == $PROGRAM_NAME
end
