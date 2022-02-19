require 'sinatra/base'
require 'sinatra/reloader'
require 'pg'


class Chitter < Sinatra::Base 
  configure :development do 
    register Sinatra::Reloader 
  end

  get '/' do
    'Welcome to Chitter'
  end

  get '/peeps/new' do
    erb :"peeps/new"
   
  end

  post '/peeps' do
  peep = params[peep]
  conn = PG.connect(dbname: 'chitter')
  conn.exec("INSERT INTO chitter_peeps (peep) VALUES('#{peep}')")
  redirect '/peeps'
  end

  get '/peeps'do
  'I am new to chitter'
  end
  run! if app_file == $0
end