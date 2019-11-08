require "sinatra/base"
require "./lib/peep"

class Chitter < Sinatra::Base
  get "/" do
    redirect :'/homepage'
  end

  get "/homepage" do
    @peeps = Peep.all

    erb :'chitter/homepage'
  end

  run! if app_file == $0
end
