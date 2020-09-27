require "sinatra/base"
require "./lib/message"
require "./lib/message_manager"
require "./lib/user"
require "./lib/user_manager"

class Chitter < Sinatra::Base
  get "/" do
    @messages = MessageManager.all
    erb :index
  end

  post "/posts" do
    MessageManager.store(Message.new(params[:content]))
    redirect "/"
  end

  post "/sign_up" do
    UserManager.sign_up(User.new(params[:username], params[:email], params[:name], params[:password]))
    redirect "/"
  end

  run! if app_file == $0
end
