require 'sinatra/base'
require './lib/posts'

class Chitter < Sinatra::Base

  get "/" do
    @posts = Posts.all
    erb :index
  end

  post "/new" do
    Posts.add(params[:new_peep])
    redirect "/"
  end

  run! if app_file == $0
end
