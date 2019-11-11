require "sinatra/base"
require_relative "lib/peep"
require_relative "./database_connection_setup"

class Chitter < Sinatra::Base
  get "/" do
    "Chitwits"
  end

  get "/chitcreek" do
    @peeps = Peep.all
    erb :"chitcreek/index"
  end

  get "/chitcreek/new_chit" do
    erb :"chitcreek/new_chit"
  end

  post "/chitcreek" do
    Peep.create(msg: params[:new_chit])
    redirect "/chitcreek"
  end

  run! if app_file == $0
end
