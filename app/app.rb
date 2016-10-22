require "sinatra/base"
require_relative "datamapper_setup"

class ChitterApp < Sinatra::Base

  get "/" do
    @posts = Post.all
    erb :index
  end

  run! if app_file == $0
end
