require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/flash'

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
    session[:name] = params[:name]
    session[:handle] = params[:handle]
    session[:message] = params[:message]
    redirect "/view_all"
  end

  get "/view_all" do
    @name = session[:name]
    @handle = session[:handle]
    @message = session[:message]
    erb :view_all
  end

  run! if app_file == $0
end
