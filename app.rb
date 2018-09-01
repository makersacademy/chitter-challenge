require 'sinatra/base'
require './lib/peep.rb'
require "./lib/select_database.rb"

class Chitter < Sinatra::Base

  get "/" do
    @peeps = Peep.all
    erb :index
  end

  post "/peep/new" do
    Peep.add(params[:new_peep])
    redirect "/"
  end
end
