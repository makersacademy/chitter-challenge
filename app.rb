require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/chitter'

class ChitterChallenge < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get ('/') do
    erb :index
  end

  get ('/peeps') do
    @peeps = Chitter.all
    erb :peeps
  end

  get ('/peeps/new') do
    erb :new
  end

  post ('/peeps') do
    Chitter.create(text: params[:text])
    redirect '/peeps'
  end

  get ('/users/new') do
    erb :users
  end

  post ('/users') do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec_params(
      "INSERT INTO users (email, password, username) VALUES($1, $2, $3);",
      [params[:email], params[:password], params[:username]]
      )
    redirect '/peeps'
  end

  run! if app_file == $0
end