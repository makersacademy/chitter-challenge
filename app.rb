require 'sinatra'
require_relative './lib/peep.rb'
require_relative './lib/user.rb'

class Chitter < Sinatra::Base

  get "/new_peep" do
    erb(:new_peep)
  end

  post "/new_peep" do
    p params[:peep]
    Peep.add(params[:peep])
    redirect("/")
  end

  get "/" do
    
    erb(:home)
  end


end