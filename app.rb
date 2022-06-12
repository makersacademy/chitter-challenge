require 'sinatra/base'
require 'sinatra/reloader'

class ChitterChallenge < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get ('/') do
    'Welcome to Chitter'
  end

  get ('/peeps') do
    @peeps = Chitter.all
    erb :peeps
  end

  get ('/peeps/new') do
    erb :new
  end

  post ('/peeps') do
    your_peep = params['text']
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps (text) VALUES('#[your_peep}');")
    redirect '/peeps'
  end

  run! if app_file == $0
end