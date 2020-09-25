require 'sinatra'
require_relative './lib/peep.rb'
require_relative './lib/user.rb'

class Chitter < Sinatra::Base

  get "/new_peep" do
    erb(:new_peep)
  end

  post "/new_peep" do
    Peep.add(params[:peep])
    redirect("/")
  end

  get "/" do
    @peeps = Peep.all
    erb(:home)
  end


end