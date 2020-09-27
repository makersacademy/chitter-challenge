require "sinatra/base"
require "./lib/message"
require "./lib/message_manager"
require "./lib/user"
require "./lib/user_manager"

class Chitter < Sinatra::Base
  get "/" do
    @username = UserManager.logged_in
    @messages = MessageManager.all
    erb :index
  end

  post "/posts" do
    username = UserManager.logged_in
    redirect "/error" if username == ""
    MessageManager.store(Message.new(params[:content], username))
    redirect "/"
  end

  get "/sign_up" do
    erb :sign_up
  end

  post "/sign_up" do
    UserManager.sign_up(
      User.new(params[:username], params[:email], params[:name], params[:password]),
    )
    redirect "/"
  end

  get "/log_in" do
    erb :log_in
  end

  post "/log_in" do
    UserManager.log_in(params[:username], params[:password])
    redirect "/"
  end

  get "/error" do
    erb :error
  end

  run! if app_file == $0
end
