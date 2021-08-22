require 'dm-postgres-adapter'
require "sinatra"
require "sinatra/base"
require "sinatra/reloader" if development?
require './lib/user'

class Chitter < Sinatra::Base
  enable :sessions
  configure :development do
    register Sinatra::Reloader
    #DataMapper.auto_upgrade!
  end

  get '/' do
    #'Hello World'
    erb :index
  end 

  post '/chitter/menu' do
    #username = params['username']
    #connection = PG.connect(dbname: 'chitter_test')
    #connection.exec("INSERT INTO users (username) VALUES('#{username}')")
    User.create(username: params[:username], email: params[:email])
    redirect '/chitter/menu'
  end

  get '/chitter/menu' do
    erb(:'chitter/menu')
  end

  run! if app_file == $0
end
