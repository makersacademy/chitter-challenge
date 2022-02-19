require 'sinatra/base'
require 'sinatra/reloader'
# require 'capybara'
require 'pg'
# require './lib/bookmarks'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Welcome to Chitter'
  end

  get '/addpeep' do
    erb :'peeps/addpeep'
  end

  post '/addpeep' do
    peeps = params[:peep]
    connection = PG.connect(dbname: 'chitter')
    connection.exec("INSERT INTO chitter (peep) VALUES('#{peep})")
    redirect '/peep'
  end

  get '/peeps' do
    'test peep'
  end


  run! if app_file == $0
end

