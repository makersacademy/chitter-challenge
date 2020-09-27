require "sinatra/base"
require "./lib/message"
require "./lib/message_manager"

class Chitter < Sinatra::Base
  get "/" do
    @messages = MessageManager.all
    erb :index
  end

  post "/posts" do
    MessageManager.store(Message.new(params[:content]))
    redirect "/"
  end

  run! if app_file == $0
end
