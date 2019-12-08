require "sinatra"
require "./lib/status.rb"

class Chitter < Sinatra::Base

  get '/' do
    erb(:index)
  end

  get "/status" do
    erb(:status)
  end

  post "/status" do
    Status.create(status: params['status'], author: params['author']) 
    redirect "/news"
  end

  get "/news" do
    @statuses = Status.all
    p @statuses[0][2]
    erb(:news)
  end

  run! if app_file == $0
end
