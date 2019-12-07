require 'sinatra/base'
# require './lib/bookmark'

class Chitter < Sinatra::Base
  enable :sessions, :method_override

  get "/peeps" do
    erb :"peeps/index"
  end

  get "/peeps/new" do
    erb :"peeps/new"
  end

  post "/peeps/new" do
    redirect "/peeps"
  end

  run! if app_file == $0
end
