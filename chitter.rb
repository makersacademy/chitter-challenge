require 'sinatra/base'
require_relative './lib/peep'
require_relative './lib/db_connection'

class Chitter < Sinatra::Base
  enable :sessions
  
  get '/' do
    redirect '/peeps'
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users/new' do
    DBConnection.connect
    DBConnection.run_query("INSERT INTO makers (name, user_name, email, password) VALUES($$#{params['name']}$$, $$#{params['username']}$$, $$#{params['email']}$$, $$#{params['password']}$$);")
    DBConnection.disconnect
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :peeps
  end

  run! if app_file == $0
end
