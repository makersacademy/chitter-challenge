require "sinatra/base"
require "./lib/peep"

class Chitter < Sinatra::Base
  get "/" do
    erb :index
  end

  get "/peeps" do
    @peep = Peep.all
    erb :peeps
  end

  run! if app_file == $0
end
