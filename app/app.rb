require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/flash'
require 'fileutils'

if ENV['ENVIRONMENT'] == 'test'
  FileUtils.touch("db/chitter-test.sqlite3")
  set :database, { adapter: "sqlite3", database: "./db/chitter-test.sqlite3" }
else
  set :database, { adapter: "sqlite3", database: "./db/chitter.sqlite3" }
end

require './lib/message'
require './lib/user'

class App < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get "/" do
    erb :index
  end

  get "/write_message" do
    if session[:user_id].nil?
      redirect "/sign_up"
    else
      erb :write_message
    end
  end

  post "/add" do
    if session[:user_id].nil?
      redirect "/sign_up"
    else
      message = Message.new(body: params[:message])
      message.user_id = session[:user_id]
      if message.save
        redirect "/view_all"
      else
        flash[:error] = message.errors.full_messages.join(", ")
        redirect "/write_message"
      end
    end
  end

  get "/view_all" do
    @messages = Message.all.order(id: :desc)
    erb :view_all
  end

  get "/sign_up" do
    erb :sign_up
  end

  post "/new_user" do
    user = User.create(
      name: params[:name],
      username: params[:username],
      email: params[:email],
      password: params[:password]
    )

    if user.valid?
      session[:user_id] = user.id
      redirect "/sign_up_success"
    else
      flash[:user_error] = user.errors.full_messages.join(", ")
      redirect "/sign_up"
    end
  end

  get "/sign_up_success" do
    erb :sign_up_success
  end

  get "/log_in" do
    erb :log_in
  end

  post "/log_in_user" do
    user = User.find_by(
      username: params[:username],
      password: params[:password]
    )

    if user.present?
      session[:user_id] = user.id
      redirect "/log_in_success"
    else
      flash[:error] = "Error: user not found"
      redirect "/log_in"
    end
  end

  get "/log_in_success" do
    erb :log_in_success
  end

  post "/log_out" do
    old_user = User.find(session[:user_id])
    flash[:notice] = "User #{old_user.username} logged out."
    session[:user_id] = nil
    redirect "/"
  end

  run! if app_file == $0
end
