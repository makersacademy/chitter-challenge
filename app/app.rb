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
    erb :write_message
  end

  post "/add" do
    user = User.create!(name: params[:name], username: params[:username])
    message = Message.new(body: params[:message])
    message.user = user
    if message.save
      redirect "/view_all"
    else
      flash[:error] = message.errors.full_messages.join(" ,")
      redirect "/write_message"
    end
  end

  get "/view_all" do
    @messages = Message.all.order(id: :desc)
    erb :view_all
  end

  run! if app_file == $0
end
