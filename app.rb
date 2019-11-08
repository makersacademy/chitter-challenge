require "sinatra/base"
require_relative "lib/peep"

class Chitter < Sinatra::Base
  get "/" do
    "Chitwits"
  end

  get "/chitcreek" do
    @peeps = Peep.all
    erb :chitcreek
  end

  get "/chitcreek/new_chit" do
    erb :new_chit
  end

  post "/chitcreek" do
    Peep.create(params[:new_chit])
    redirect "/chitcreek"
  end

  run! if app_file == $0
end
