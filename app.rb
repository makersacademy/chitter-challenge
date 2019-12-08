require "sinatra"
require "./lib/status.rb"

class Chitter < Sinatra::Base

  get '/' do
    erb(:index)
  end

  get "/status" do
    erb(:status)
  end

  get "/news" do
    @statuses = Status.all
    erb(:news)
  end

  run! if app_file == $0
end
