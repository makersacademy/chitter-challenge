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

  run! if app_file == $0
end
