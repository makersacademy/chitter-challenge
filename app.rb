require 'sinatra/base'
require 'pg'
require_relative 'lib/peep'

class Chitter < Sinatra::Base
  get "/" do
    erb :index
  end

  get "/peeps/new" do
    erb :"peeps/new"
  end

  post "/peeps" do
    Peep.create(message: params["message"])
    redirect "/peeps"
  end

  get "/peeps" do
    @peeps = Peep.all
    erb :"peeps/index"
  end
end
