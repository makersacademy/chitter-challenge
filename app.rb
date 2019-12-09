require "sinatra"
require "./lib/status.rb"
require "./lib/user.rb"

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
    @users = User.all
    erb(:news)
  end

  get "/signup" do
    erb(:signup)
  end

  post "/signup" do
    User.create(email: params['email'], password: params['password'],\
    username: params['username'], name: params['name'])
    redirect "/news"
  end

  run! if app_file == $0
end
