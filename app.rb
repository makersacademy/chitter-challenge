require 'sinatra/base'
require './lib/post'

class Chitter < Sinatra::Base

  get '/' do
    "Welcome to Chitter"
  end

  get '/posts' do
    @posts = Post.all

    erb(:"posts/index")
  end

  get '/posts/new' do
    erb(:"posts/new")
  end

  post '/posts' do
    chit = params['chit']
    con = PG.connect(dbname: 'chitter_test')
    con.exec("INSERT INTO posts (chit) VALUES('#{chit}')")
    redirect '/posts'
  end

  run! if app_file == $0

end
