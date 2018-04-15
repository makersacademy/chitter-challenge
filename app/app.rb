require 'sinatra/base'
require './lib/peeps'

class Chitter < Sinatra::Base

  get "/" do
    @peeps = Peeps.all
    erb :index
  end

  post "/new" do
    @peeps
    redirect "/"
  end

  run! if app_file == $0
end
