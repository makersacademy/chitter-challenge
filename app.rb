require 'pg'
require 'sinatra/base'
require 'sinatra/reloader'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions

  get '/' do
    'Welcome to Chitter!'
  end

  get '/peeps/new' do
    erb :"peeps/new"
  end

  post '/peeps' do
    Peeps.add(peep: params[:peep])
    redirect '/peeps'
  end

  get '/peeps' do
    conn = PG.connect(dbname: 'chitter_test')
    @result = conn.exec("SELECT * FROM peeps")
    erb :"peeps/index"
  end

  run! if app_file == $0
end
