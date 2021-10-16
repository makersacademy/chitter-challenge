require "sinatra/base"
require "sinatra/reloader"
require "./lib/peep"
require "pg"

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get "/" do
    "Welcome to Chitter!"
  end

  get "/chitter" do
    @peeps = Peep.all
    erb :"chitter/index"
  end

  post "/chitter/new" do
    Peep.create(text: params[:peep])
    redirect "/chitter"
  end

  run! if app_file == $0
end
