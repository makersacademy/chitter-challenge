require "sinatra/base"
require "pg"
class Chiter < Sinatra::Base

  get "/posts" do
    erb :index
  end

  get "/posts/new" do
    erb :"/posts/new"
  end

  post "/posts/new" do
    connection = PG.connect( dbname: 'chitter_test')
    @text = params[:text]
    connection.exec("INSERT INTO Post (text) VALUES ('#{@text}');")
  end










  run! if app_file == $0
end
