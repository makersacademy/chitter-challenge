require 'sinatra/base'

class Chitter < Sinatra::Base
  get "/" do
    erb :"peeps/index"
  end

  # get "/peeps" do
  #   "Peeps"
  # end

  get "/peeps/new" do
    erb :"peeps/new"
  end

  # post "peeps/new" do

  #   redirect "/peeps"
  # end

  run! if app_file ==$0
end
