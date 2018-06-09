require 'sinatra/base'
require 'uri'
require 'pg'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    'Page is working!'
    # This will become the sign in page?
  end

  get '/peeps/post' do
    erb :"peeps/post"
  end

  post '/peeps' do
    p params
    p @message = params['message']
    p @name = params['name']
    p @username = params['username']
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps (message, name, username) VALUES ('#{@message}', '#{@name}', '#{@username}')")
    redirect '/peeps'
  end

  get '/peeps' do
    p @message = params['message']
    p @name = params['name']
    p @username = params['username']
    erb :index
  end

  run! if app_file == $0
end
