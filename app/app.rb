require "sinatra/base"
require_relative "datamapper_setup"

class ChitterApp < Sinatra::Base

  get "/" do
    @posts = Post.all
    erb :index
  end

  get "/peeps/new" do
    erb :"peeps/new"
  end

  post "/peeps" do
    @peep = Post.create(message: params[:new_peep])
    redirect to "/"
  end

  run! if app_file == $0
end
