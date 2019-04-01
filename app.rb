require 'sinatra/base'
require './lib/chitter.rb'
require './lib/database_connection_setup.rb'

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

  get '/chitter/new' do
    erb(:'chitter/new')
  end

  post '/chitter' do
    content = params['content']
    connection = PG.connect(dbname: 'chitter_app_test')
    connection.exec("INSERT INTO chitter (name, handle, time, content) VALUES ('someone', 'no username', CURRENT_TIMESTAMP, '#{content}');")
    redirect '/chitter'
  end

  get '/users/new' do
    erb(:'users/new')
  end

  post '/users' do
    redirect '/chitter'
  end

  run! if app_file == $PROGRAM_NAME
end
