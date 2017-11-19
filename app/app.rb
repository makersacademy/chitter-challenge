ENV['RACK_ENV'] ||= 'development'

require "sinatra/base"
require "./app/models/peep"

class Chitter < Sinatra::Base
  get "/" do
    @peeps = Peep.all(order: [:created_at.desc])
    erb :index
  end

  get "/new_peep" do
    erb :new_peep
  end

  get "/sign_up" do
    erb :sign_up
  end

  post "/save_peep" do
    message = params[:peep]
    Peep.create(message: message)
    redirect "/"
  end

  run! if app_file == $0
end
