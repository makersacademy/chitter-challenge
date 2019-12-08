require "sinatra"
require "./lib/status.rb"

class Chitter < Sinatra::Base

  get '/' do
    erb(:index)
  end

  get "/status" do
    # @statuses = Status.all
    "What's on your mind?"
    # erb(:status)
  end

  get "/news" do
    "Current Events!"
  end

  run! if app_file == $0
end
