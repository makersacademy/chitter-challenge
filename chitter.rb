require 'sinatra/base'
require 'pg'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    'Welcome to Chitter!'
  end

  get '/peeps' do
    @message = $message
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    $message = params['message']
    connection = PG.connect(dbname: 'chitter_manager_test')
    connection.exec("INSERT INTO peeps (message) VALUES('#{$message}');")
    redirect '/peeps'
  end

  run! if app_file == $0
end
