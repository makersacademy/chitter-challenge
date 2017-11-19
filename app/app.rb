ENV['RACK_ENV'] ||= 'development'

require "sinatra/base"
require "./app/models/peep"

class Chitter < Sinatra::Base
  get "/" do
    @peeps = Peep.all
    erb :index
  end

  get "/new_peep" do
    erb :new_peep
  end

  post "/save_peep" do
    message = params[:peep]
    Peep.create(message: message)
    redirect "/"
  end

  run! if app_file == $0
end
