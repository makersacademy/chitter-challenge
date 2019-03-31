require 'sinatra/base'
require 'pg'

class ChitterApp < Sinatra::Base

  get '/' do
    conn = PG.connect(dbname: 'chitter_test')
    result = conn.exec("SELECT * FROM posts")
    @posts = result.map { |record| record['post'] }.reverse
    erb :index
  end

  post '/post' do
    conn = PG.connect(dbname: 'chitter_test')
    conn.exec("INSERT INTO posts (post) VALUES ('#{params[:content]}')")
    redirect '/'
  end

  run! if app_file == $0
end
