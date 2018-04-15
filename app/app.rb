require 'sinatra/base'
require './lib/peeps'

class Chitter < Sinatra::Base

  get "/" do
    Peeps.all
    erb :index
  end

  post "/new" do
    Peeps.all
    redirect "/"
  end

  run! if app_file == $0
end
