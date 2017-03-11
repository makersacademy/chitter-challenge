ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require './models/dm_start'


class Chitter < Sinatra::Base

  enable :sessions

  get "/" do
    erb(:homepage)
  end

  get "/create_account" do
    params[:email_address]
    params[:password]
    erb(:create_account)
  end

  post "/logged_in" do
    @user = session[:email_address]=params[:email_address]
    erb(:logged_in)
  end
end
