require "sinatra/base"
require "./lib/peep"

class Chitter < Sinatra::Base
  get "/" do
    @peep = Peep.all
    erb :index
  end

  post "/peeps" do
    @peep = Peep.add_peep
    erb :peeps
  end

  get "/new" do
    erb :peeps
  end

  post "/new" do
    Peep.create(peep: params["message"])
    redirect :index
  end

  run! if app_file == $0
end
