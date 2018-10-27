require "sinatra/base"
require "sinatra/flash"
require "./lib/user.rb"
require "./lib/message.rb"
require_relative "./database_connection_setup.rb"

class Chitter < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash

  get "/" do
    @messages = Message.all
    if !(@messages.is_a? Array)
      flash[:messagenotice] = "No messages to display"
      @messages = nil
    end
    flash[:personalgreeting] = "Welcome, #{session[:username]}" if session[:username]
    erb :"message/message"
  end

  post "/message/new" do
    @message = Message.create(text: params[:message], sender: session[:userid])
    flash[:messagenotice] = "New message created"
    redirect "/"
  end

  post "/message/update/:id" do
    @message = Message.update(text: params[:message], sender: session[:userid])
    flash[:messagenotice] = "Message updated"
    redirect "/"
  end

  post "/message/reply/:id" do
    @message = Message.reply(text: params[:replytext], sender: session[:userid], original: params[:original])
    flash[:messagenotice] = "Message replied to"
    redirect "/"
  end

  get "/user" do
    erb :"user/login"
  end

  get "/user/logout" do
    session.clear
    flash[:usernotice] = "Logout successful"
    redirect "/"
  end

  post "/user" do
    p "now verify this user"
    user = User.login(name: params[:name],password: params[:password])
    if user.is_a?(User)
      session[:username] = user.name
      session[:userid] = user.id
      redirect "/"
    else
      flash[:usernotice] = user
      redirect "/user"
    end
  end

  get "/user/new" do
    erb :"user/new"
  end

  post "/user/new" do
    p "now create"
    user = User.create(name: params[:name],password: params[:password1],email: params[:email],receive_email: params[:receive_email])
    if user.is_a?(User)
      flash[:usernotice] = "New user created! Welcome, #{user.name}. Login now to start chittering"
      redirect "/"
    else
      flash[:usernotice] = message
      redirect "/user/new"
    end
  end

  get "/user/forgot" do
    erb :"user/forgot"
  end

  post "/user/forgot" do
    p "now forgot"
    message = User.send_password_email(name: params[:name],email: params[:email])
    flash[:usernotice] = message
    redirect "/user" if  message == "Email sent"
    redirect "/user/forgot"
  end

  run! if app_file == $0

end
