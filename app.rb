require "sinatra/base"
require "./lib/peep"

class Chitter < Sinatra::Base

  get "/" do
    @peeps = Peep.all
    erb(:index)
  end

  post "/posted" do
    Peep.create(message: params["posted_message"])
    redirect("/")
  end

  run! if app_file == $0
end