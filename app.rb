require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/peep'

class ChitterChallenge < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Welcome to Chitter, You have signed up successfully!'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end 

  get '/peeps/new' do
    erb :"peeps/new"
  end

  post '/peeps' do
    text = params['text']
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps (message) VALUES('#{text}');")
    redirect '/peeps'
  end

  run! if app_file == $0
end