require "sinatra/base"
require "sinatra/flash"
require "./lib/user.rb"
require "./lib/message.rb"
require_relative "./database_connection_setup.rb"

class Chitter < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash

  get "/message" do
    @messages = Message.all
    @messages = nil if !(@messages.is_a? Array)
    erb :"message/message"
  end

  post "/message/new" do
    @message = Message.create(text: params[:message], sender: session[:userid])
    flash[:messagenotice] = "New message created"
    redirect "/message"
  end

  delete '/message/:id' do
    Message.delete(id: params[:id])
    flash[:messagenotice] = "Message deleted"
    redirect '/message'
  end

  patch "/message/:id" do
    @message = Message.update(text: params[:updatetext], sender: session[:userid],id: params[:id])
    flash[:messagenotice] = "Message updated"
    redirect "/message"
  end

  post "/message/:id/reply" do
    @message = Message.reply(text: params[:replytext], sender: session[:userid], response_to: params[:id])
    flash[:messagenotice] = "Message replied to"
    redirect "/message"
  end

  get "/message/:id/reply" do
    @message = Message.find(id: params[:id])
    erb :"message/reply"
  end

  get "/message/:id/update" do
    @message = Message.find(id: params[:id])
    erb :"message/update"
  end

  get "/user" do
    erb :"user/login"
  end

  get "/user/logout" do
    session.clear
    flash[:usernotice] = "Logout successful"
    redirect "/message"
  end

  post "/user" do
    user = User.login(name: params[:name],password: params[:password])
    if user.is_a?(User)
      session[:username] = user.name
      session[:userid] = user.id
      redirect "/message"
    else
      flash[:usernotice] = user
      redirect "/user"
    end
  end

  get "/user/new" do
    erb :"user/new"
  end

  post "/user/new" do
    user = User.create(name: params[:name],password: params[:password1],email: params[:email],receive_email: params[:receive_email])
    if user.is_a?(User)
      flash[:usernotice] = "New user created! Welcome, #{user.name}. Login now to start chittering"
      redirect "/message"
    else
      flash[:usernotice] = message
      redirect "/user/new"
    end
  end

  get "/user/forgot" do
    erb :"user/forgot"
  end

  post "/user/forgot" do
    message = User.send_password_email(name: params[:name],email: params[:email])
    flash[:usernotice] = message
    redirect "/user" if  message == "Email sent"
    redirect "/user/forgot"
  end

  run! if app_file == $0

end
